# frozen_string_literal: true

require 'spec_helper'
require_relative '../../install/docker_installer'

RSpec.describe DockerInstaller do
  let(:installer) { described_class.new }

  before do
    allow(installer).to receive(:logger).and_return(double.as_null_object)
    allow(installer).to receive(:run_pacman_install)
    allow(installer).to receive(:system)
  end

  describe '#install' do
    it 'calls run_pacman_install with the correct package name' do
      installer.install
      expect(installer).to have_received(:run_pacman_install).with('docker docker-compose lazydocker')
    end
  end

  describe '#post_install' do
    it 'adds the user to the docker group' do
      allow(ENV).to receive(:fetch).with('SUDO_USER', nil).and_return('testuser')
      installer.post_install
      expect(installer).to have_received(:system).with('usermod -aG docker testuser')
    end
  end
end
