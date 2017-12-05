require 'sinatra/base'
require(File.expand_path('lib/json_handler', File.dirname(__FILE__)))


class MessageServer < Sinatra::Base
  json_handler = JSON_handler.new()

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    json_handler.accept(params[:json_form_input])
    redirect '/messages/confirmation'
  end

  get '/messages/confirmation' do
    json_handler.confirmation
  end
end
