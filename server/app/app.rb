require 'sinatra/base'

class MessageServer < Sinatra::Base
  enable :sessions
  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    session[:message_json] = JSON.parse(params[:json].to_json)
    redirect '/messages/confirmation'
  end

  get '/messages/confirmation' do
    erb :'messages/confirmation'
  end
end