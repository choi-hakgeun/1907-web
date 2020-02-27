/**
 * data_process.js
 * date :2020.02.26
 * get, post, put, del 타입의 라우터로 데이터 처리
 */
var express = require('../begin/node_modules/express');
var bodyParser = require('../begin/node_modules/body-parser');

var app = express();
app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended:false}));//아직 쓸모는 없지만 교재에 있음.
//변수를 선언합니다.
var items = [
	{'name' : '우유', 'price' : 2000},
	{'name' : '홍차', 'price' : 5000},
	{'name' : '커피', 'price' : 5000}

];


app.get('/products', function(req, resp){
	resp.send(items);
});

app.get('/products/:id', function(req, resp){//:id는 호환성이 없어서 비추
	//변수를 선언합니다.
	var id = Number(req.params.id);
	
	if(isNaN(id)){
		//오류 : 잘못된 경로
		resp.send({
			error:'숫자를 입력하세요!'
		});
	}else if(items[id]){
		//정상
		resp.send(items[id]);		
	}else {
		//오류 : 요소가 없을 경우
		response.send({
			error:'존재하지 않는 데이터 입니다!'
		});
	}	
});

app.post('/products', function (req, resp){
	//변수를 선언합니다.
	var name = req.body.name;
	var price = req.body.price;
	var item = {
			'name':'name',
			'price':'price'
	};
	//데이터를 추가합니다.
	items.push(item);
	
	//응답합니다.
	resp.send({
		message:'데이터를 추가했습니다.',
		data : item
	});	
});

app.put('/products/:id', function (req, resp){
	//변수를 선언합니다.
	var id = Number(req.params.id);
	var name = req.body.name;
	var price = req.body.price;
	
	if(items[id]){
		//데이터를 수정합니다.
		if(name){ items[id].name = name; }
		if(price){ items[id].price = price; }
		
		//응답합니다.
		resp.send({
			message:"데이터를 수정했습니다.",
			data : items[id]				
		});
	}else{
		//오류 : 요소가 없을 경우
		resp.send({
			error : "존재하지 않는 데이터 입니다!"
		});
	}
});

app.del('/products/:id', function(req, resp){
	//변수를 선언합니다.	
	var id = Number(req.params.id);
	
	if(isNaN(id)){
		//오류:잘못된 경로
		resp.send({
			error:"숫자를 입력하세요!"
		});		
	}else if (items[id]){
		//정상:데이터 삭제
		items.splice(id, 1);
		resp.send({
			message:"데이터를 삭제했습니다."
		});		
	}else{
		//오류 : 요소가 없을 경우
		resp.send({
			error:"존재하지 않는 데이터 입니다!"
		});
	}
});

//웹서버를 실행합니다.
app.listen(9991, function(){
	console.log('http://127.0.0.1:9991/');
})