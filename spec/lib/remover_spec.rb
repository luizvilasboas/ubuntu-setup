# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/remover'

RSpec.describe Remover do
  let(:logger) { instance_double(Logger, info: nil, error: nil) }

  before do
    # rubocop:disable RSpec/AnyInstance
    allow_any_instance_of(described_class).to receive(:logger).and_return(logger)
    # rubocop:enable RSpec/AnyInstance
  end

  describe '#remove' do
    context 'with pacman manager' do
      it 'calls run_pacman_remove' do
        remover = described_class.new('test_app', 'test_package', :pacman)
        allow(remover).to receive(:run_pacman_remove)
        remover.remove
        expect(remover).to have_received(:run_pacman_remove).with('test_package')
      end
    end

    context 'with yay manager' do
      it 'calls run_yay_remove' do
        remover = described_class.new('test_app', 'test_package', :yay)
        allow(remover).to receive(:run_yay_remove)
        remover.remove
        expect(remover).to have_received(:run_yay_remove).with('test_package')
      end
    end

    context 'with flatpak manager' do
      it 'calls run_flatpak_remove' do
        remover = described_class.new('test_app', 'test_package', :flatpak)
        allow(remover).to receive(:run_flatpak_remove)
        remover.remove
        expect(remover).to have_received(:run_flatpak_remove).with('test_package')
      end
    end

    context 'with unsupported manager' do
      it 'logs an error' do
        remover = described_class.new('test_app', 'test_package', :unsupported)
        remover.remove
        expect(logger).to have_received(:error).with('Unsupported package manager: unsupported')
      end
    end
  end
end
