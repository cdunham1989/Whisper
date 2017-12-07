require 'thin'
require 'sinatra/base'
require 'em-websocket'
require(File.expand_path('lib/ruby/json_handler', File.dirname(__FILE__)))

EventMachine.run do

  class MessageServer < Sinatra::Base
    json_handler = JSON_handler.new()

    get '/' do
      erb :index
    end

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

  @clients = []

  EM::WebSocket.start(:host => '0.0.0.0', :port => '3001') do |ws|
    ws.onopen do |handshake|
      @clients << ws
      ws.send "Connected to #{handshake.path}"
    end

    ws.onclose do
      ws.send "Closed"
      @clients.delete ws
    end

    ws.onmessage do |msg|
      EventMachine.stop_event_loop if msg == 'Please stop'
      puts "Received Message: #{msg}"
      @clients.each do |socket|
        socket.send msg
      end
    end
  end

  ENV['RACK_ENV'] == 'test' ? EventMachine.stop_event_loop : (MessageServer.run! :port => 9292)
end
