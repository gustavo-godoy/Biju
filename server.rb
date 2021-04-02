#!/usr/bin/env ruby
require 'sinatra/base'

class App < Sinatra::Base

  ####
  # Router
  ####

  get '/' do
    erb :index
  end

  # Tudo em ./run/ é exposto!
  # Usando patch por conveniência, mesmo não sendo semântico.
  patch '/run/:service' do |service|
    `run/#{service}`
  end

  not_found do
    if true #request.get?
      status 404
      erb :q0q
    else
      "404 - Not Found"
    end
  end
end

App.run!
