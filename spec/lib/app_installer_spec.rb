# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/app_installer'

RSpec.describe AppInstaller do
  let(:logger) { instance_double(Logger, info: nil, error: nil) }

  before do
    # rubocop:disable RSpec/AnyInstance
    allow_any_instance_of(described_class).to receive(:logger).and_return(logger)
    # rubocop:enable RSpec/AnyInstance
  end

  describe '#exec' do
    context 'with pacman manager' do
      it 'calls run_pacman_install' do
        installer = described_class.new('test_app', 'test_package', 'pacman')
        allow(installer).to receive(:run_pacman_install)
        installer.exec
        expect(installer).to have_received(:run_pacman_install).with('test_package')
      end
    end

    context 'with yay manager' do
      it 'calls run_yay_install' do
        installer = described_class.new('test_app', 'test_package', 'yay')
        allow(installer).to receive(:run_yay_install)
        installer.exec
        expect(installer).to have_received(:run_yay_install).with('test_package')
      end
    end

    context 'with flatpak manager' do
      it 'calls run_flatpak_install' do
        installer = described_class.new('test_app', 'test_package', 'flatpak')
        allow(installer).to receive(:run_flatpak_install)
        installer.exec
        expect(installer).to have_received(:run_flatpak_install).with('test_package')
      end
    end

    context 'with unsupported manager' do
      it 'logs an error' do
        installer = described_class.new('test_app', 'test_package', 'unsupported')
        installer.exec
        expect(logger).to have_received(:error).with('Unsupported package manager: unsupported')
      end
    end
  end
end
