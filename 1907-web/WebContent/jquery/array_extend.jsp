<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>array_extend</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3>array_extend</h3>
<p id='info'>
$.extend()를 사용하여 배열의 요소를 추가한다.
</p>
<script>
let obj = { name : '길동이'};

//$.extend를 사용한 요소 추가
$.extend(obj, {age :18, kor:90, eng:60, mat:80});

$.each(obj, function(key, item){
	console.log(key ':' + item);
})

</script>

</body>
</html>