require 'spec_helper'
require_relative '../../install/git_installer'

RSpec.describe GitInstaller do
  let(:installer) { GitInstaller.new }

  before do
    allow(installer).to receive(:logger).and_return(double.as_null_object)
  end

  describe '#install' do
    it 'calls run_pacman_install with the correct package name' do
      expect(installer).to receive(:run_pacman_install).with('git')
      installer.install
    end
  end

  describe '#post_install' do
    it 'configures git with username and email' do
      allow(ENV).to receive(:[]).with('SUDO_USER').and_return('testuser')
      expect(installer).to receive(:system).with('sudo -u testuser git config --global user.name "Your Name"')
      expect(installer).to receive(:system).with('sudo -u testuser git config --global user.email "youremail@example.com"')
      installer.post_install
    end
  end
end
