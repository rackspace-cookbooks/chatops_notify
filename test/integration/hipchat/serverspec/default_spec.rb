require 'spec_helper'

describe file('/var/log/chatops_notify') do
  its(:content) { should match(/HTTP Response: 2/) }
end
