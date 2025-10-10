# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/config_installer'

RSpec.describe ConfigInstaller do
  let(:logger) { instance_double(Logger, info: nil, error: nil) }

  before do
    # rubocop:disable RSpec/AnyInstance
    allow_any_instance_of(described_class).to receive(:logger).and_return(logger)
    # rubocop:enable RSpec/AnyInstance
  end

  describe '#add_symlink' do
    context 'with config file not existing' do
      it 'raise an exception' do
        config_installer = described_class.new('path/to/my/config', 'path/to/my/dest')
        expect { config_installer.add_symlink }.to raise_error(IOError)
      end
    end

    context 'with config file existing' do
      let(:from) { 'path/to/my/config' }
      let(:to) { 'path/to/my/dest' }
      let(:config_installer) { described_class.new from, to }

      before do
        allow(File).to receive(:exist?).with(from).and_return true
        allow(FileUtils).to receive :mkdir_p
        allow(FileUtils).to receive :ln_s
      end

      it 'create the folder to store the config' do
        config_installer.add_symlink
        expect(FileUtils).to have_received(:mkdir_p).with('path/to/my')
      end

      it 'create system link to the file' do
        config_installer.add_symlink
        expect(FileUtils).to have_received(:ln_s).with(from, to, force: true)
      end
    end
  end
end
