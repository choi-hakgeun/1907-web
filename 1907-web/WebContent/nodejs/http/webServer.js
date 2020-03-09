/**
 * webServer
 * date : 2020.02.27
 * 웹서버 구축 
 */
let http = require('http'); //http모듈을 사용하기위해 읽어드림

let db = require('../begin/node_modules/oracledb'); //오라클모듈을 사용하기위해 읽어드림
let dbConf = require('./lib/dbConfig');
db.autoCommit = true;

let express = require('../begin/node_modules/express');
let bodyParser = require('../begin/node_modules/body-parser');

const hostName = 'localhost';
const port = 4000;

var config = {
	user			: dbConf.user,
	password		: dbConf.password,
	connectString   : dbConf.connectString 
		
}
var app = express();
app.engine('html', require('../begin/node_modules/ejs').renderFile);
app.use(express.static(__dirname + '/css')); //정적경로명을 만들어 경로명을 만들지 않아도 됨 
app.use(express.static(__dirname + '/lib'));
app.use(bodyParser.urlencoded( {extended : true } ) )


var server = http.createServer(app);
var conn; //db connection object

function connect(){
	db.getConnection(config, function(err, connection){
		if(err){
			console.log('connection fail...' + err);			
		}else{
			console.log('connection.........');
			conn = connection;
		}
	})
}
connect();

app.post('/insert', function(req, resp){
	resp.render(__dirname +'/insert_form.ejs')
})
app.post('/insertR', function(req, resp){
	let msg = "회원정보가 정상적으로 추가되었습니다.";
	let param = [
		req.body.mId,   req.body.mName, 
		req.body.rDate, req.body.grade
	];	
	let sql = 'insert into member(mId, mName, rDate, grade) '
			+ ' values(:mId, :mName, :rDate, :grade)';
	conn.execute(sql, param, function(err, data){
		if(err) msg=err;
		else{
			resp.render(__dirname + '/insert_result.ejs', {'msg':msg});
		}
	});
})
app.post('/modify', function(req, resp){
	
})
app.post('/modifyR', function(req, resp){
	
})
app.post('/deleteR', function(req, resp){
	let param=[ req.body.mId];
	let msg = "자료가 정상적으로 삭제되었습니다.";
	let sql = "delete from member where mId=:mId ";
	conn.execute(sql, param, function(err, data){
		if(err) msg = err;
		else{
			resp.render(__dirname + '/delete_result.ejs',
					{'msg':msg, 'findStr':req.body.findStr}
			);
		}
	})
})
app.post('/view', function(req, resp){
	let mId = req.body.mId;
	let sql = "select mid, mName, to_char(rDate, 'rrrr-mm-dd') rDate, grade "
			+ " from member "
		    + " where mId=:mId ";
	conn.execute(sql, [mId], function(err, data){		
		resp.render(__dirname+'/view.ejs', {'data' : data, 'findStr' : req.body.findStr})
	})
})
//페이지 정보가 없이 단순히 domain 정보만 들어온 경우
app.all('/', function(req, resp){
	select(req, resp);
})
app.all('/select', function(req, resp){
	select(req, resp);
})

function select(req, resp){
	let findStr='';
	if(req.method=='POST'){
		findStr = req.body.findStr // /select?findStr=abc  request.getParameter("findStr"); 와 같은것.		
	}
	let sql = "select mid, mname, to_char(rdate, 'rrrr-mm-dd') rdate, grade "
			+ " from member "
			+ " where mid like :id or mname like :id "
			+ " order by mname asc ";
	conn.execute( sql, ["%" + findStr +"%"], function(err, data) {//인수값이 하나만 있기 때문에 where 절에 like :id에 해당하는 두가지 부분에 다 들어감 
		if(err){
			console.log(err);			
		}else{
			console.log(data);
			resp.render(__dirname + '/select.ejs',
					   {'data' : data, 'findStr' : findStr })
		}
	});
	
}


server.listen(port, hostName);
console.log('http://%s:%d 로 접속하세요', hostName, port);

/*function connect(){
	
	db.getConnection(
		{
			user 			: dbConf.user, 
			password 		: dbConf.password,
			connectString   : dbConf.connectionString
			
		}, 
		
		function(err, connection){
			if(err){
				console.log(err.message);
				return;
			}
	
			console.log('connection OK....');
			
			let sql = "select * from member";
			connection.execute(sql, function(err2, result){
				console.log('row : ' + result.rows);
				disCon(connection);
			});
		});	
}

function disCon(conn){
	console.log('disconnection.....');
	conn.close(function(err){
		if(err){
			console.log(err.message);			
		}
	})
}*/
