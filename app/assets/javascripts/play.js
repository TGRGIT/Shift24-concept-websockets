// connect to server like normal
dispatcher = new WebSocketRails('localhost:3000/websocket');

function sendmessage(){
    message = $('#message').val() ;

    console.log('channel : sending msg: ' + message);
    channel.trigger('new_message', {user_name: $('#pname').html().trim(), msg_body: message});
    $('#message').val('');
}

function bindEvents(){
    console.log('ready to bind');
    console.log(channel);

    channel.bind('client_connected', function(data) {
        $('#header').show();
        console.log('channel : msg received: ' + data);
    });

    channel.bind('new_message', function(data) {
        $('#msgs').append("<br/>"+data['user_name']+":" + data['msg_body']);
        console.log('channel : msg received: ' + data);
    });

    $('#send').click(function(e){
        sendmessage();
    });
}

channel = "";
$.getJSON('/play/whatsMyChannel',function(cname){
    // subscribe to the channel
    channel = dispatcher.subscribe(cname.toString());
    bindEvents();
    console.log('events bound');
});


