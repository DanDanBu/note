var express = require('express');
var bodyParser = require('body-parser');
var app = express();

//encode url
app.use(bodyParser.urlencoded({extended: false}));

app.post('/form', function(req, res) {
  res.send(req.body.str.split('').reverse().join(''))
});

app.listen(process.argv[2]);
