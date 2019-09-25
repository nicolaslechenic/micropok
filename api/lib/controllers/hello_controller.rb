module Micropok
  class HelloController < Sinatra::Base
    before do
      headers['Cache-Control'] = 'public, max-age=300'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'GET,PUT,POST,DELETE,OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin, content-type, x-requested-with'
    end

    options '/*' do; end

    get '/api/hello' do
      json(message: 'Hello poker !')
    end
  end
end
