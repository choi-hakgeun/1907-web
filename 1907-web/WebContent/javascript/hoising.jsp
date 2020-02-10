<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hoising</title>
</head>
<body>
<h3>hoising</h3>
변수나 함수를 선언하기 전에 사용 가능하도록 메모리에 미리 상주시킨다는 의미
<script>
//변수의 hoising
irum = 'hong';
var irum;
console.log('irum : ', irum);

let age = 0;
age = 18;//전역형 변수가 아니기 때문에 사용전에 선언해야한다.
console.log('age : ', age);

a();

function a(){
	console.log('hoising된 함수');
}

f(); //not defined

f = function(){
	console.log('hoising 되지 않은 함수');
}
</script>

</body>
</html>