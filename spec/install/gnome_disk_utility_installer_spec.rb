# frozen_string_literal: true

require 'spec_helper'
require_relative '../../install/gnome_disk_utility_installer'

RSpec.describe GnomeDiskUtilityInstaller do
  let(:installer) { described_class.new }

  before do
    allow(installer).to receive(:logger).and_return(double.as_null_object)
    allow(installer).to receive(:run_pacman_install)
  end

  describe '#install' do
    it 'calls run_pacman_install with the correct package name' do
      installer.install
      expect(installer).to have_received(:run_pacman_install).with('gnome-disk-utility')
    end
  end
end
