var mymodule = require('./mymodule.js');
var fs = require('fs');
var path = require('path');

var dirName = process.argv[2];
var ext = process.argv[3];

mymodule(dirName, ext, function(err, files){
   //console.log("Arrived");
   if(err){
     console.log("Error occur");
   }else{
      for(var i = 0; i < files.length; i++){
       console.log(files[i]);
      }
   }
});
