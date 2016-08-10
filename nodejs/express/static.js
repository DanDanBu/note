var path = require('path');
var express = require('express');
var app = express();

app.use(express.static(process.argv[3] || path.join(__dirname, 'public')));

//command argument value in number 3 position. 
app.listen(process.argv[2]);
