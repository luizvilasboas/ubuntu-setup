# frozen_string_literal: true

require 'spec_helper'
require_relative '../../install/base_installer'

RSpec.describe BaseInstaller do
  describe '#install' do
    it 'raises NotImplementedError' do
      installer = described_class.new('test_app')
      expect { installer.send(:install) }.to raise_error(NotImplementedError)
    end
  end
end
