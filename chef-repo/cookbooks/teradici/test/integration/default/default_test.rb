# # encoding: utf-8

# Inspec test for recipe teradici::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

if os.linux?
  describe service('sshd') do
    it { should be_installed }
    it { should be_running }
    it { should be_enabled }
  end
  describe file('/home/demo.xml') do
    it { should exist }
  end
elsif os.windows?
  describe registry_key('HKLM\SOFTWARE\DemoCO') do
    its('Hello') { should eq 'World' }
  end

  describe file('c:\users\demo.xml') do
    it { should exist }
  end
end
