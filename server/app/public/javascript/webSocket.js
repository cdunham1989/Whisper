$(document).ready(function() {

  function addMessage(msg) {
    $("#chat-log").append("" + msg + "");
  }

  var socket, host;
  host = "ws://localhost:9292";

  function connect() {
    try {
      console.log(host);
      socket = new WebSocket(host);

      addMessage("Socket State: " + socket.readyState + "\n");

      socket.onopen = function() {
        addMessage("Socket State: " + socket.readyState + " (open)\n");
      };

      socket.onclose = function() {
        addMessage("Socket State: " + socket.readyState + " (close)\n");
      };

      socket.onmessage = function(msg) {
        addMessage("Received: " + msg.data);
      };

    } catch (exception) {
      addMessage("Error: " + exception);
    }
  }

  function send() {
    var text = $("#message").val();

    if (text == '') {
      addMessage("Please Enter a Message");
      return;
    }

    try {
      socket.send(text);
      addMessage("Sent: " + text);
    } catch (exception) {
      addMessage("Failed to Send");
    }

    $("#message").val('');
  }


  $(function() {
    connect();
  });

  $('#message').keypress(function(event) {
    if (event.keyCode == '13') {
      send();
    }
  });

  $("#disconnect").click(function() {
    socket.close();
  });

});
