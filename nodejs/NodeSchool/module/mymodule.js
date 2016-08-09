var fs = require('fs');
var path = require('path');

module.exports = function(dirname, ext, callback){
   var list = [];
   fs.readdir(dirname, function(err, files){
      if(err){
         return callback(err);
      }else{
         files.forEach(function(file){
           if(path.extname(file) === "." + ext){
              list.push(file);
           }
         });
      }
    return callback(null, list);
  });
};
