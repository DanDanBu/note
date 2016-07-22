# Node.js Basic #

## Properties ##

* **Single thread**
  Every I/O is Asynchronous request (Avoiding frequently context switching)
  
* **Asynchronous I/O (Non-blocking I/O)**
  Because Node.js is a single thread model, it make I/O request asynchronous to finish the current process first.
  
* **Event-driven program design model**
  In Node.js, the coding style is different from other language is that Node.js has callback function to handle I/O event.
  
The following is an example:
```
  db.query('SELECT * from some_table', function(res){
      res.output();
  });
```
This will happen an I/O event to search database. In Node.js, their is an event queue which can handle event occur.
While your code is finished, nodejs will call the callback function until event inside the queue is empty.



