# Express #

## app.use vs app.all ##

There is big difference between the use of these two examples. 
Functions registered with **app.use** are general middleware functions
and is called appropriate to their position on the **middleware stack**, 
typically inside an app.configure function. 

This type of middleware is usually placed before **app.route** , with the exception of error handling functions.

On the other hand **app.all** is a routing function (not usually called middleware) 
which covers all HTTP methods and is called only **inside** app.route. 
If any of your previous router function matches the */some/path* and did not call the next callback, 
**app.all** will not be executed, so **app.all** functions are usually on the beginning of your routing block.
