# frozen_string_literal: true

require 'spec_helper'
require_relative '../../install/nvim_installer'

RSpec.describe NvimInstaller do
  let(:installer) { described_class.new }

  before do
    allow(installer).to receive_messages(logger: double.as_null_object, run_pacman_install: nil, system: nil)
  end

  describe '#install' do
    it 'calls run_pacman_install with the correct package name' do
      installer.install
      expect(installer).to have_received(:run_pacman_install).with('neovim')
    end
  end

  describe '#post_install' do
    before do
      allow(ENV).to receive(:fetch).with('SUDO_USER', nil).and_return('testuser')
      allow(Dir).to receive(:home).with('testuser').and_return('/home/testuser')
    end

    it 'backs up old config' do
      installer.post_install
      expect(installer).to have_received(:system).with('sudo -u testuser mv /home/testuser/.config/nvim{,.bak}')
    end

    it 'backs up old local share' do
      installer.post_install
      expect(installer).to have_received(:system).with('sudo -u testuser mv /home/testuser/.local/share/nvim{,.bak}')
    end

    it 'backs up old local state' do
      installer.post_install
      expect(installer).to have_received(:system).with('sudo -u testuser mv /home/testuser/.local/state/nvim{,.bak}')
    end

    it 'backs up old cache' do
      installer.post_install
      expect(installer).to have_received(:system).with('sudo -u testuser mv /home/testuser/.cache/nvim{,.bak}')
    end

    it 'clones the repository' do
      allow(installer).to receive(:system).with(/git clone/).and_return(true)
      installer.post_install
      expect(installer).to have_received(:system)
        .with('sudo -u testuser git clone https://github.com/LazyVim/starter /home/testuser/.config/nvim')
    end

    it 'removes .git folder' do
      allow(installer).to receive(:system).with(/git clone/).and_return(true)
      installer.post_install
      expect(installer).to have_received(:system).with('sudo -u testuser rm -rf /home/testuser/.config/nvim/.git')
    end
  end
end
