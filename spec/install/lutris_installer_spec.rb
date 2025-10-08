# frozen_string_literal: true

require 'spec_helper'
require_relative '../../install/lutris_installer'

RSpec.describe LutrisInstaller do
  let(:installer) { described_class.new }

  before do
    allow(installer).to receive(:logger).and_return(double.as_null_object)
    allow(installer).to receive(:run_flatpak_install)
  end

  describe '#install' do
    it 'calls run_flatpak_install with the correct package name' do
      installer.install
      expect(installer).to have_received(:run_flatpak_install).with('net.lutris.Lutris')
    end
  end
end
