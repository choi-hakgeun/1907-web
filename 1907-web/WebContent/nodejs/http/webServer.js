/**
 * webServer
 * date : 2020.02.27
 * 웹서버 구축 
 */
let http = require('http');
let fs = require('fs');

let db = require('../begin/node_modules/oracledb');
let dbConf = require('./lib/dbConfig');

const hostName = 'localhost';
const port = 4000;

const server = http.createServer( function(req, resp){
	let url = req.url;
	
	//파비콘 제어	
	if(req.url == './favicon.ico'){
		resp.writeHead(404);
		resp.end;
		return;
	}
	
	resp.statusCode=200;
	resp.setHeader('Content-type', 'text/html;charset=utf-8');
		
	/*resp.write('<li>url: '+ url);
	resp.write('<li>dirname : ' +__dirname);//어떤 파일을 요청한 경로명
	resp.write('<br/>방가방가');
	resp.end();*/
	//물음표 뒷부분을 스플릿으로 자른 후 배열에 넣어는 변수를 선언하고...
	resp.write(fs.readFileSync(__dirname + url));
	resp.end();
});

server.listen(port, hostName);
console.log('http://%s:%d 로 접속하세요', hostName, port);
