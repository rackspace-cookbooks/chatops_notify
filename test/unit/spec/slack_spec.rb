require_relative 'spec_helper'
require_relative '../../../libraries/helpers'

include Helpers::Http

RSpec.describe 'provider_chatops_slack' do
  before do
    @webhook = ENV['SLACK_WEBHOOK']
    @body = { channel: "##{ENV['SLACK_CHANNEL']}", username: 'Chef-Test', text: 'Unit Test', icon_emoji: ':fork_and_knife:' }
    allow(File).to receive(:write).with('/var/log/chatops_notify', 'HTTP Response: 200').and_return('/var/log/chatops_notify', 'HTTP Response: 200')
  end

  it 'gets HTTP 200 OK' do
    http_returned_object = http_uri(@body, @webhook)
    expect(http_returned_object).to eq '200'
  end
end
