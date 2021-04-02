#!/usr/bin/env ruby
require 'sinatra/base'

class App < Sinatra::Base
   get '/' do
      "OK!"
   end

   # Anything in ./run/ is public runnable!
   get '/run/:service' do |service|
     `run/#{service}`
   end

end

App.run!
