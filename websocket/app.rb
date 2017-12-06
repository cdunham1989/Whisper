# require 'thin'
# require 'sinatra/base'
# require 'em-websocket'
#
# EventMachine.run do
#   class WebsocketServer < Sinatra::Base
#     get '/' do
#       erb :index
#     end
#   end
#
#   @clients = []
#
#   EM::WebSocket.start(:host => '0.0.0.0', :port => '3001') do |ws|
#     ws.onopen do |handshake|
#       @clients << ws
#       ws.send "Connected to #{handshake.path}"
#     end
#
#     ws.onclose do
#       ws.send "Closed"
#       @clients.delete ws
#     end
#
#     ws.onmessage do |msg|
#       EventMachine.stop_event_loop if msg == 'Please stop'
#       puts "Received Message: #{msg}"
#       @clients.each do |socket|
#         socket.send msg
#       end
#     end
#   end
#
#   WebsocketServer.run! :port => 9292
# end
