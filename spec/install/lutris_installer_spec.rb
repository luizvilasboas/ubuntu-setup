require 'spec_helper'
require_relative '../../install/lutris_installer'

RSpec.describe LutrisInstaller do
  let(:installer) { LutrisInstaller.new }

  before do
    allow(installer).to receive(:logger).and_return(double.as_null_object)
  end

  describe '#install' do
    it 'calls run_flatpak_install with the correct package name' do
      expect(installer).to receive(:run_flatpak_install).with('net.lutris.Lutris')
      installer.install
    end
  end
end
