/**
 * Product.js
 * date : 2020.20.24
 * 입고 자료가 발생하면 자동으로 재고량을 증가시켜 출력하는 프로그램
 * 프로그램.(localStorage.setItem(key, v), getItem(key) )
 */
// npm install node-localstorage
var LocalStorage = require('node-localstorage').LocalStorage;
localStorage = new LocalStorage('./');

let products = []; //입고자료
let stock = []; //재고
let Data = function(code, codeName, ea, price){
	this.code = code;
	this.codeName = codeName;
	this.ea = ea;
	this.price = price;
	this.amt = ea * price;	
}
//입고자료를 배열에 저장한 후 code에 해당하는 품목의
//재고데이터에 누적 계산
let input = function(data){//입고자료를 배열에 저장	
	products.push(data);
	//재고 체크
	let flag = true; //true->stock에 추가, false->stock update
	for(let i=0; i<stock.length ;i++){
		let s=stock[i];
		if(s.code == data.code){
			s.ea = Number(s.ea) + Number(data.ea);
			s.amt = Number(s.amt) + Number(data.amt);
			flag = false;
		}
	}
	if(flag){
		let sData = new Data(data.code, data.codeName, data.ea, data.price);
		stock.push(sData);
	}
}
let output = function(){ //입고자료를 모두 출력
	console.log("입고 자료 목록--------------------");
	for(var d of products){//products 배열의 하나를 i 오브젝트에 담는것
		console.log('%s \t %s \t %s \t %s \t %s', d.code, d.codeName, 
				d.ea.toLocaleString('en'), d.price.toLocaleString('en'), 
				d.amt.toLocaleString('en'));//d 객체의 code필드를 출력		
	}
	console.log("재고 자료 목록--------------------");
	for(var s of stock){//products 배열의 하나를 i 오브젝트에 담는것
		console.log('%s \t %s \t %s \t %s', s.code, s.codeName, 
				s.ea.toLocaleString('en'), s, d.amt.toLocaleString('en'));
				//s 객체의 code필드를 출력		
	}
	//for(j in products){} products 배열을 j인덱스에 담는것(?)
}
//배열을 문자열(JSON)로 변환하여 localStrage에 저장
let save = function(){
	let tempP = JSON.stringify(products);
	let tempS = JSON.stringify(stock);
	
	localStorage.setItem("products", tempP); //로컬스토리지에 저장되는 값은 키값도 문자열, 벨류값도 문자열임.
	localStorage.setItem("stock", tempS);
}
// localStrage에 있는 값을 배열에 저장
let read = function(){
	let tempP = localStorage.getItem("products");
	let tempS = localStorage.getItem("stock");
	
	products = JSON.parse(tempP);
	stock = JSON.parse(tempS);
}
let main = function(argv){
	let p1 = new Data("aaaa", "세우깡", 1000,500);
	let p2 = new Data("aaaa", "세우깡", 1000,500);
	let p3 = new Data("bbbb", "양우깡", 1500,500);
	let p4 = new Data("cccc", "고구마깡", 500,2000);
	
	input(p1);
	input(p2);
	input(p3);
	input(p4);
	
	save();
	read();
	output();
}