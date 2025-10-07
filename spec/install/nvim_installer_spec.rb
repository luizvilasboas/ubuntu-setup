require 'spec_helper'
require_relative '../../install/nvim_installer'

RSpec.describe NvimInstaller do
  let(:installer) { NvimInstaller.new }

  before do
    allow(installer).to receive(:logger).and_return(double.as_null_object)
  end

  describe '#install' do
    it 'calls run_pacman_install with the correct package name' do
      expect(installer).to receive(:run_pacman_install).with('neovim')
      installer.install
    end
  end

  describe '#post_install' do
    it 'installs lazyvim' do
      allow(ENV).to receive(:[]).with('SUDO_USER').and_return('testuser')
      allow(Dir).to receive(:home).with('testuser').and_return('/home/testuser')
      expect(installer).to receive(:system).with('sudo -u testuser mv /home/testuser/.config/nvim{,.bak}')
      expect(installer).to receive(:system).with('sudo -u testuser mv /home/testuser/.local/share/nvim{,.bak}')
      expect(installer).to receive(:system).with('sudo -u testuser mv /home/testuser/.local/state/nvim{,.bak}')
      expect(installer).to receive(:system).with('sudo -u testuser mv /home/testuser/.cache/nvim{,.bak}')
      expect(installer).to receive(:system).with('sudo -u testuser git clone https://github.com/LazyVim/starter /home/testuser/.config/nvim').and_return(true)
      expect(installer).to receive(:system).with('sudo -u testuser rm -rf /home/testuser/.config/nvim/.git')
      installer.post_install
    end
  end
end
