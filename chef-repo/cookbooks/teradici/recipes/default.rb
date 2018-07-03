#
# Cookbook:: teradici
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


cookbook_file "#{node['directory'][node['os']]}demo.xml" do
  source 'demo.xml'
  action :create
end

case node['os']
when 'windows'
  registry_key node['registry']['location'] do
    values [{
      name: node['registry']['keyname'],
      type: :string,
      data: node['registry']['keyvalue']
      }]
      action :create
  end
when 'linux'
  service 'sshd' do
    action :enable
  end
end
