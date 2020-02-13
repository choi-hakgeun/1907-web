<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>String 객체</title>
</head>
<body>
<h3>String 객체</h3>
<p id='info'>
<fieldSet>
 <ol>
   <li>length : 문자열의 길이</li>
   <li>charAt(index) : index위치의 문자</li>
   <li>indexOd(str) : lastIndexOf(str) : str의 위치</li>
   <li>replace(regExp, replacement) : 문자열 변경(정규식)</li>
   <li>split(seperator, limit) : 문자열을 limit의 갯수만큼 분해</li>
   <li>substring(start [,end]) : 문자열 추출</li>
 </ol>
</fieldSet>

<script>
let str = "abc 가나다 123 다나가";
console.log(str + ':length= > '+ str.length);
let c = str.charAt(1);
console.log('str.charAt(1) : ', c );
let index1 = str.indexOf('가');
let index2 = str.lastIndexOf('가');
console.log('str.indexOf("가") : ', index1);
console.log('str.lastIndexOf("가") :', index2);
let rep1 = str.replace('가', '각');
let rep2 = str.replace(/가/, '간');
let rep3 = str.replace(/가/g, '갇'); //정규식

console.log('rep1 : ', rep1);
console.log('rep2 : ', rep2);
console.log('rep3 : ', rep3);

let array = str.split(' ');
for(d in array){
	console.log(d+ ' : ' +array[d]);
}

let s1 = str.substring(0,3);
console.log('str.substring(0,3) : ', s1)
let s2 = str.substring(11);
console.log('str.substring(11) : ', s2);

let str2 = "881213-1234567";
let year = str2.substring(0,2);
let month = str2.substring(2,4);
let date - str.substring(4,6);
let gen = Number(str2.substring(7,8) );
let r = (gen%2==0)? "남자" : "여자";
//생년, 생월, 생일, 성별을 구별하여 console에 출력

console.log('y')

</script>


</body>
</html>