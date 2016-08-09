//require filesystem and path package
var fs = require('fs') ;
var path = require('path') ;

//third and fourth command argument for folder path and extension
var folder = process.argv[2] ;
var ext = '.' + process.argv[3] ;

//use file system readdir function to read directory
fs.readdir(folder, function (err, files) { 
//handle error
  if (err) return console.error(err); 
  //check every file if extname of file equal to our load in argument.
  //then log it on console.
  files.forEach(function(file) { 
    if (path.extname(file) === ext) { 
       console.log(file); 
    } 
  });
}); 
