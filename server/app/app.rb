require 'sinatra/base'

class MessageServer < Sinatra::Base
  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    redirect '/messages/confirmation'
  end

  get '/messages/confirmation' do
    'true'
  end
end