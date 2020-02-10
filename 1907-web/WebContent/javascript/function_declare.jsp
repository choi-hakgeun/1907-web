<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>function_declare</title>
</head>
<body>
<h3>function declare</h3>
<h4>익명함수</h4>
<script>
var f = function(){
	return 'hong';
}
var f2 = function(a){
	return 'return value : ' + a;
}
console.log(f());
console.log(f2('park'));
</script>

<h4 id='h4'>callback 함수</h4>
<script>
    let h4 = document.getElementById('h4');
    h4.onmouseover = abc;
    function abc(){
    	console.log('h4에 마우스가 올라감....');
    }
</script>

<h4>선언적 함수(hoising)</h4>
<script>
hoi('123');
function hoi(n){	
	console.log(n);
}
hoi('456');
</script>
<h4>함수적 선언not hoising</h4>
<script>
let ff = function func(){
	console.log('함수적 선언(not hoising)');
}
ff();
</script>
<script>
( function(){
	console.log('즉시 실행된 함수');
  }()
);
</script>
<h4>화살표 함수</h4>
<script>
//function func2(a,b){return a+b;}
let func2 = (a,b)=>{return a+b};

console.log(func2(10,20));
</script>

</body>
</html>