#!/usr/bin/env ruby
require 'sinatra/base'
require 'rack/contrib'
require 'json'
require 'open3'

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
    
    begin
      tudoCerto = true

      if params['_args']
        _args = Array(params['_args'])
        
        # Pode gerar bugs no futuro. Não sei. Por em quanto vou deixar:
        _args.flatten!
        
        _args.reject! {|item| item.to_s.empty?}
        
        resposta, status = Open3.capture2("./run/#{_service}", *_args)
      else
        resposta, status = Open3.capture2("./run/#{_service}")
      end
      
    rescue => putslamerda
      tudoCerto = false
      resposta = nil
      
      puts '[DEBUG <---'
      puts putslamerda
      puts '---> DEBUG]'
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
