require 'spec_helper'
require_relative '../../install/gnome_disk_utility_installer'

RSpec.describe GnomeDiskUtilityInstaller do
  let(:installer) { GnomeDiskUtilityInstaller.new }

  before do
    allow(installer).to receive(:logger).and_return(double.as_null_object)
  end

  describe '#install' do
    it 'calls run_pacman_install with the correct package name' do
      expect(installer).to receive(:run_pacman_install).with('gnome-disk-utility')
      installer.install
    end
  end
end
