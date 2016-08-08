var http = require('http');
// require buffer list 
var bl = require('bl');
// store the result.
var results = [];
var count = 0;

//print result function
function printResults () {
  for (var i = 0; i < 3; i++)
    console.log(results[i]);
}


//function handling http Get
function httpGet (index) {
  http.get(process.argv[2 + index], function (response) {
  //use pipe and buffer list to make sure the results will be in sequence.
    response.pipe(bl(function (err, data) {
      if (err) return console.error(err);
      //make data to string into results
      results[index] = data.toString();
      count++;

      if (count == 3) // yay! we are the last one!
         printResults();
    }));
  });
}


//call httpGet function
for (var i = 0; i < 3; i++)
   httpGet(i)
