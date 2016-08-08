var http = require('http'); 
//include buffer list
var bl = require('bl') ;



http.get(process.argv[2], function (response) { 
 //use the pipe() function reads data from a readable stream as it becomes 
 //available and writes it to a destination writable stream.
 
 response.pipe(bl(function (err, data) { 
   //error handle
   if (err) return console.error(err); 
   data = data.toString() ;
   console.log(data.length); 
   console.log(data);
 })); 
});
