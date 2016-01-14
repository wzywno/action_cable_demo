App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append('<p>'+data['message']+'</p>')

  speak: (message)->
    @perform 'speak', message: message



$(document).on 'keypress', '#chat-form input', (event) ->
  if event.keyCode is 13
    App.room.speak event.target.value

    event.target.value = ''
    event.preventDefault()