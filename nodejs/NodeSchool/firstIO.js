//require file system
var fs = require('fs') ;

//use synchronous reading file function
var contents = fs.readFileSync(process.argv[2]);

//print out lines what we read in. 
var lines = contents.toString().split('\n').length - 1 ;
console.log(lines) ;
