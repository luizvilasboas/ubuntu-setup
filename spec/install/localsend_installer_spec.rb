require 'spec_helper'
require_relative '../../install/localsend_installer'

RSpec.describe LocalsendInstaller do
  let(:installer) { LocalsendInstaller.new }

  before do
    allow(installer).to receive(:logger).and_return(double.as_null_object)
  end

  describe '#install' do
    it 'calls run_yay_install with the correct package name' do
      expect(installer).to receive(:run_yay_install).with('localsend-bin')
      installer.install
    end
  end
end
