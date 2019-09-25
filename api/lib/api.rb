require 'pry'
require 'sinatra'
require 'sinatra/json'

Dir['./lib/controllers/*_controller.rb'].each { |file| require file }

module Micropok
  class Api < Sinatra::Base
    use(HelloController)
  end
end
