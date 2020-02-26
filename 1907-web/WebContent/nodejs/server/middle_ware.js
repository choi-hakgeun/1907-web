/**
 * middle_ware
 */

var express = require('../begin/node_modules/express');
var app = express();
app.use(function(req, resp, next){
	console.log('first');
	next();	
})

app.use(function(req, resp, next){
	console.log('second');
	next();
})
app.use(function(req, resp, next){
	resp.send("<h1>Hello Middlewear !!</h1>");
})
app.listen(9991, function(){
	console.log("방가.....url:127.0.0.1:9991");
})