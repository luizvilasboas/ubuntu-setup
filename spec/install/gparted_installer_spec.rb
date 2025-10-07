require 'spec_helper'
require_relative '../../install/gparted_installer'

RSpec.describe GpartedInstaller do
  let(:installer) { GpartedInstaller.new }

  before do
    allow(installer).to receive(:logger).and_return(double.as_null_object)
  end

  describe '#install' do
    it 'calls run_pacman_install with the correct package name' do
      expect(installer).to receive(:run_pacman_install).with('gparted')
      installer.install
    end
  end
end
