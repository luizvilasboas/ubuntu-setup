require 'spec_helper'
require_relative '../../install/flatpak_installer'

RSpec.describe FlatpakInstaller do
  let(:installer) { FlatpakInstaller.new }

  before do
    allow(installer).to receive(:logger).and_return(double.as_null_object)
  end

  describe '#install' do
    it 'calls run_pacman_install with the correct package name' do
      expect(installer).to receive(:run_pacman_install).with('flatpak')
      installer.install
    end
  end

  describe '#post_install' do
    it 'adds the flathub remote' do
      expect(installer).to receive(:system).with('flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo').and_return(true)
      installer.post_install
    end
  end
end
