require 'spec_helper'
require_relative '../../install/chromium_installer'

RSpec.describe ChromiumInstaller do
  let(:installer) { ChromiumInstaller.new }

  before do
    allow(installer).to receive(:logger).and_return(double.as_null_object)
  end

  describe '#install' do
    it 'calls run_pacman_install with the correct package name' do
      expect(installer).to receive(:run_pacman_install).with('chromium')
      installer.install
    end
  end
end
