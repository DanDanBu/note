var http = require('http');
//require map
var map = require('through2-map');


var server = http.createServer(function(req, res){
   req.pipe(map(function (chunk) {
     return chunk.toString().toUpperCase().split('').join('');
   })).pipe(res);
});

server.listen(process.argv[2]);
