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
'it should intialise connection between client and websocket'
        'view has content "Socket State: 0"
        "view has content "Socket State: 1 (open)"
        "view content "Received: Connected to /"

"it should disconnect client and websocket when the user decides"
          "view has content "Socket State: 3 (close)"

"it takes the user\'s message string and appends it to the view content"

"it throws error when connection to client fails"
          "view has content "Erro: ""

"it throws error when form input 'message' is empty string"
          "view has content "Erro: ""("Please Enter a Message")""

"it confirms message has been sent to server"
          "view has content ("Sent: " + text)""

"it confirms message is received by server"
          "view has content ("Received: " + text)""
