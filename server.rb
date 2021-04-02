#!/usr/bin/env ruby
require 'sinatra/base'
require 'rack/contrib'
require 'json'

class Biju < Sinatra::Base

  #####
  # Middleware
  #####

  # Corrige bug de processamento de POST do Sinatra
  use Rack::JSONBodyParser

  #####
  # POST - rodar scripts
  #####

  # Tudo em ./run/ é exposto!
  post '/run/:_service' do |_service|
  
    content_type :json
    
    _args = Array(params['_args'])
    _args = _args.map {|item| "'#{item}'"}
    _args = _args.join(' ')
    
    begin
      tudoCerto = true
      resposta = `./run/#{_service} #{_args}`
    rescue => putslamerda
      tudoCerto = false
      resposta = nil
      
      p '[DEBUG <---'
      puts putslamerda
      p '---> DEBUG]'
    ensure
      retorno = {tudoCerto: tudoCerto, resposta: resposta}
    end
    
    JSON.generate(retorno)
  end

  #####
  # GET Router
  #####

  get '/' do
    erb :index
  end

  get '/oi-mundo' do
    erb :oi_mundo
  end
  
  #####
  # Auto e 404
  #####

  get '/:outros' do |arquivo|
    arquivo = "auto/#{arquivo}"

    puts arquivo
    puts "views/#{arquivo}.erb"

    if File.exist? "views/#{arquivo}.erb"
      erb arquivo.to_sym
    else
      not_found
    end
  end

  not_found do
    status 404
    erb :q0q
  end
end

Biju.run!
