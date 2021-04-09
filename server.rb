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
      if params['_args']
        _args = Array(params['_args'])
        
        # Pode gerar bugs no futuro. Não sei. Por em quanto vou deixar:
        _args.flatten!
        
        _args.reject! {|item| item.to_s.empty?}
        
        resposta, erro, status = Open3.capture3("./run/#{_service}", *_args)
      else
        resposta, erro, status = Open3.capture3("./run/#{_service}")
      end

    status = status.exitstatus
    
    rescue Errno::ENOENT # Não encontrado
      status = 127
      resposta = ''
      erro = 'Não encontrado'

    rescue => putslamerda
      puts '[DEBUG <---'
      puts putslamerda.class
      puts putslamerda.message
      puts '---> DEBUG]'
      
      status = 1
      resposta = ''
      erro = putslamerda.message
    ensure
      retorno = {status: status, erro: erro, resposta: resposta}
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
