require 'spec_helper'
require_relative '../../install/steam_installer'

RSpec.describe SteamInstaller do
  let(:installer) { SteamInstaller.new }

  before do
    allow(installer).to receive(:logger).and_return(double.as_null_object)
  end

  describe '#install' do
    it 'calls run_pacman_install with the correct package name' do
      expect(installer).to receive(:run_pacman_install).with('steam')
      installer.install
    end
  end
end
