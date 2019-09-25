require 'spec_helper'

RSpec.describe Micropok::HelloController do
  include Rack::Test::Methods

  def app
    @app ||= described_class.new
  end

  it 'return expected response' do
    get '/api/hello'
    message = JSON.parse(last_response.body)['message']
    expect(message).to eq('Hello poker !')
  end
end
