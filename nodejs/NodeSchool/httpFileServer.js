var http = require('http');
var fs = require('fs');

//argument of number 3 and number 4 is http server port and file path.
var port = process.argv[2];
var file = process.argv[3];


var server = http.createServer(function(req, res){
   var readStream = fs.createReadStream(file, function(err, data){
     if(err) throw err;
     console.log(data);
   });
   //use pipe to read data from readable stream and writes it to the destination writable data.
   readStream.pipe(res);
});

server.listen(port);
