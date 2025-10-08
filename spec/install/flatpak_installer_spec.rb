# frozen_string_literal: true

require 'spec_helper'
require_relative '../../install/flatpak_installer'

RSpec.describe FlatpakInstaller do
  let(:installer) { described_class.new }

  before do
    allow(installer).to receive(:logger).and_return(double.as_null_object)
    allow(installer).to receive(:run_pacman_install)
    allow(installer).to receive(:system)
  end

  describe '#install' do
    it 'calls run_pacman_install with the correct package name' do
      installer.install
      expect(installer).to have_received(:run_pacman_install).with('flatpak')
    end
  end

  describe '#post_install' do
    it 'adds the flathub remote' do
      allow(installer).to receive(:system).with('flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo').and_return(true)
      installer.post_install
      expect(installer).to have_received(:system).with('flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo')
    end
  end
end
