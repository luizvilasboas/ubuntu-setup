# frozen_string_literal: true

require 'spec_helper'
require_relative '../../install/git_installer'

RSpec.describe GitInstaller do
  let(:installer) { described_class.new }

  before do
    allow(installer).to receive_messages(logger: double.as_null_object,
                                         run_pacman_install: nil,
                                         system: nil,
                                         gets: 'test')
  end

  describe '#install' do
    it 'calls run_pacman_install with the correct package name' do
      installer.install
      expect(installer).to have_received(:run_pacman_install).with('git')
    end
  end

  describe '#post_install' do
    before do
      allow(ENV).to receive(:fetch).with('SUDO_USER', nil).and_return('testuser')
    end

    it 'configures git with username' do
      installer.post_install
      expect(installer).to have_received(:system).with('sudo -u testuser git config --global user.name "test"')
    end

    it 'configures git with email' do
      installer.post_install
      expect(installer).to have_received(:system).with('sudo -u testuser git config --global user.email "test"')
    end
  end
end
