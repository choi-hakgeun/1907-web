<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for_of</title>
<link rel='styleSheet' type='text/css' href='../css/my_css.css' />
</head>
<body>
<h3>for-of</h3>
<p id='info'>
    배열의 정수를 임의의 개수를 저장한 후 for of를 사용하여
    최대값과 최소값을 검색하여 div에 출력하시오.
</p>
<div id='result'></div>
<script>
let array = [52, 273, 103, 32, 57, 103, 31, 2]
let max = array[0];//배열의 첫번째 값이 최대값이라고 생각
let min = array[0];//배열의 첫번째 값이 최소값이라고 생각
let r = document.getElementById('result');
for(let v of array){
	if( max < v ) max = v;
	if( min > v ) min = v;
}
r.innerHTML = '<li>최대값 : ' + max
            + '<li>최소값 : ' + min;

</script>

</body>
</html>