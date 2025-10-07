require 'spec_helper'
require_relative '../../install/docker_installer'

RSpec.describe DockerInstaller do
  let(:installer) { DockerInstaller.new }

  before do
    allow(installer).to receive(:logger).and_return(double.as_null_object)
  end

  describe '#install' do
    it 'calls run_pacman_install with the correct package name' do
      expect(installer).to receive(:run_pacman_install).with('docker docker-compose lazydocker')
      installer.install
    end
  end

  describe '#post_install' do
    it 'adds the user to the docker group' do
      allow(ENV).to receive(:[]).with('SUDO_USER').and_return('testuser')
      expect(installer).to receive(:system).with('usermod -aG docker testuser')
      installer.post_install
    end
  end
end
