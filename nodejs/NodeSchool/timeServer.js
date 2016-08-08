var net = require('net');
var strftime = require('strftime');

//this is the third argument value of the command while run on the terminal
var port = process.argv[2];

var server = net.createServer(function(socket){
  socket.write(strftime('%Y-%m-%d %H:%M'));
  socket.end('\n');
});

server.listen(port);
