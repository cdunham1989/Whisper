require(File.expand_path('../spec_helper', File.dirname(__FILE__)))
require(File.expand_path('../../app/public/javascript/webSocket.js', File.dirname(__FILE__)))


# websocket module
'should have an addMessage method'
'should have an send method'
'should have an connect method'

# webSocket class
'should have an onopen method'
'should have an onclose method'
'should have an onmessage method'

'it should attempt to intialise connection between client and websocket'
        'view has content "Socket State: 0" / "socket.readyState = 0 i.e. connection is yet to be established'

'it should establish to intialise connection between client and websocket'
        "view has content 'Socket State: 1 (open)'" / "socket.readyState = 1 i.e. connection has been established and messages can be exchanged between the client and the server"

'it should attempt to close/ disconnect to the connection between client and websocket'
        "socket.readyState = 2 i.e. The connection is going through the closing handshake."

'it should close/ disconnect to the connection between client and websocket'
        "view has content 'Socket State: 3 (close)'" / "socket.readyState = 3 i.e. The connection has been closed or could not be opened.'

'it should intialise the apps index view'
  "view content 'Received: Connected to /'"

"it takes the user\'s message string and appends it to the view content"

"it throws error when connection to client fails"
          "view has content "Erro: ""

"it throws error when form input 'message' is empty string"
          "view has content "Erro: ""("Please Enter a Message")""

"it confirms message has been sent to server"
          "view has content ("Sent: " + text)""

"it confirms message is received by server"
          "view has content ("Received: " + text)""
