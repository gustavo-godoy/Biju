#!/usr/bin/env ruby
require 'sinatra/base'

class App < Sinatra::Base

  #####
  # POST - rodar scripts
  #####

  # Tudo em ./run/ é exposto!
  post '/run/:_service' do |_service|
    _args = Array(params['_args']).join(' ')

    begin
      retorno = `./run/#{_service} #{_args}`
    rescue
      return nil
    end

    retorno
  end

  #####
  # GET Router
  #####

  get '/' do
    erb :index
  end

  get '/ola-mundo' do
    erb :ola_mundo
  end

  #####
  # 404
  #####

  not_found do
    status 404
    erb :q0q
  end
end

App.run!
