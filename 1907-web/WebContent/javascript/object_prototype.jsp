<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>object_prototype</title>
<link rel='styleSheet' type='text/css' href='../css/my_css.css' />
<style>
#title {
	background-color: #888;
	color: #fff;
	padding: 3px;
	box-sizing: border-box;
}

.items {
	padding: 2px;
	boxsizing: border-box;
}

#result span {
	display: inline-block;
}

#result .items:hover {
	background-color: #ddd;
	cursor: pointer;
}
.code { width:80px;}
.codeName{width:130px;}
.ea{width:80px;}
.price{width:100px;}
#result div:last-chile{border-bottom:4px solid #aaf}
</style>
</head>
<body>
	<h3>prototype을 사용한 메서드 선언</h3>
	<p id='info'></p>
	<div id='result'>
		<div id='title'>
			<span class='code'>제품코드</span> 
			<span class='codeName'>제품명</span> 
			<span class='ea'>수량</span> 
			<span class='price'>금액</span>
		</div>
	</div>

	<script>
function Product(code, codeName, ea, price){
	this.code = code;
	this.codeName = codeName;
	this.ea = ea;
	this.price = price;
}
//Product로 만들어진 객체들이 사용하는 공유메서드(prototype)
Product.prototype.setCode = function(code){
	this.code = code;
};
Product.prototype.setCodeName = function(codeName){ this.codeName = codeName };
Product.prototype.setEa = function(ea){ this.ea = ea };
Product.prototype.setPrice = function(price){ this.price = price};

Product.prototype.toJSON = function(){
	let str = {
			'code'     : this.code,
			'codeName' : this.codeName,
			'ea'       : this.ea,
			'price'    : this.price
			  };
	return str;
}

Product.prototype.toHTML = function(){
	let str = "<div class='items'>"
	        + "<span class='code'>"      + this.code     + "</span>"
	        + "<span class='codeName'>"  + this.codeName + "</span>"
	        + "<span class='ea'>"        + this.ea       + "</span>"
	        + "<span class='price'>"     + this.price    + "</span>"
	        + "</div>";
	return str;
}
// Product 객체를 생성하여 배열에 추가한 후 입력값을 div에 표시하시오.
let r = document.getElementById('result');
let array = [];
let p1 = new Product('a001', '새우깡', 1000, 500);
let p2 = new Product('a002', '양파깡', 5000, 1500);
let p3 = new Product('a003', '감자깡', 500, 400);

array.push(p1);
array.push(p2);
array.push(p3);

for(d of array){
	r.innerHTML += d.toHTML();
}
for(d of array){
	console.log(d.toJSON());
}

</script>

</body>
</html>