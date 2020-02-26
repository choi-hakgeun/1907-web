/**
 * web server test
 * date : 2020.02.26
 */
var express = require('../begin/node_modules/express');

var app = express();
app.listen(9991, function(){
	console.log('server running at http://127.0.0.1:9999');
})

app.use(function(req, resp){
	resp.send('<h1>하이~방가...방가...</h1>');
})