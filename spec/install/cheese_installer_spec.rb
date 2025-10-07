require 'spec_helper'
require_relative '../../install/cheese_installer'

RSpec.describe CheeseInstaller do
  let(:installer) { CheeseInstaller.new }

  before do
    allow(installer).to receive(:logger).and_return(double.as_null_object)
  end

  describe '#install' do
    it 'calls run_pacman_install with the correct package name' do
      expect(installer).to receive(:run_pacman_install).with('cheese')
      installer.install
    end
  end
end
