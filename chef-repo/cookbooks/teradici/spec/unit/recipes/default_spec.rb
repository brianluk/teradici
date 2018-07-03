#
# Cookbook:: teradici
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'teradici::default' do
  context 'On Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') do |node|
        node.override['directory']['linux'] = '/temp/'
      end
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'enables sshd service' do
      expect(chef_run).to enable_service('sshd')
    end

    it 'adds demo.xml to home directory' do
      expect(chef_run).to create_cookbook_file('/temp/demo.xml')
    end

  end

  context 'On Windows 2012 R2' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2') do |node|
        node.override['directory']['windows'] = 'c:\\temp\\'
        node.override['registry']['location'] = 'HKLM\\SOFTWARE\\Test'
        node.override['registry']['keyname'] = 'World'
        node.override['registry']['keyvalue'] = 'Hello'
      end
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates a registry key hello with value world' do
      expect(chef_run).to create_registry_key('HKLM\\SOFTWARE\\Test').with(
        values: [
          {
            name: 'World',
            type: :string,
            data: 'Hello'
          }])
    end

    it 'adds demo.xml to user directory' do
      expect(chef_run).to create_cookbook_file('c:\\temp\\demo.xml')
    end
  end
end
