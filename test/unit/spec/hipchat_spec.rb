require_relative 'spec_helper'
require_relative '../../../libraries/helpers'

include Helpers::Http

RSpec.describe 'provider_chatops_slack' do
  before do
    @webhook = ENV['HIPCHAT_WEBHOOK']
    @body = { color: 'green', notify: false, message: 'Unit Test', message_format: 'text' }
    allow(File).to receive(:write).with('/var/log/chatops_notify', 'HTTP Response: 204').and_return('/var/log/chatops_notify', 'HTTP Response: 204')
  end

  it 'gets HTTP 204 OK' do
    http_returned_object = http_uri(@body, @webhook)
    expect(http_returned_object).to eq '204'
  end
end
