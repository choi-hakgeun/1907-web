/**
 * module_request.js 
 */
let req = require('request');
req('http://www.google.com', function(error, response, body){
	console.log(body);
})