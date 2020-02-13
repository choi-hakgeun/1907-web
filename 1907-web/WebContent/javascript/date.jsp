<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>date</title>
</head>
<body>
<h3>date</h3>
<fieldset id = 'info'>
    생년월일을 입력하여 오늘 날짜를 기준으로 나이, 개월수, 시간수, 분수를 계산하여 표시하시오.
</fieldset>
<form name = 'frm'>
<label>생년월일</label>
<input type='date' name='birth' /><br/>

<label>오늘날짜</label>
<input type='date' name='now' /><p/>
<input type='button' value='날수계산' name='btn' />
</form>
<div id='result'></div>

<script>
let tempDate = new Date();
let r = document.getElementById('result');

frm.birth.valueAsDate = tempDate; //valueAsDate 나중에 날짜로 형변환하기 편함.
frm.now.valueAsDate = tempDate;

frm.btn.onclick = function(){
	let str = '';
	let d1 = new Date(frm.birth.value);
	let d2 = new Date(frm.now.value);
	
	let d = (d2-d1)/1000; // 1/1000초 단위를 초 단위로 변경
	
	let mi = d/60;//분수
	let ho = d/60/60;//시간수
	let da = d/60/60/24; //날수
	let mo = parseInt(d/60/60/24/30);//개월수
	let ye = parseInt(d/60/60/24/30/12); //년수
	
	str = '<li>년수 : '   + ye
	    + '<li>개월수 : ' + mo
	    + '<li>날수 : '   + da
	    + '<li>시간수 : ' + ho
	    + '<li>분수 : '   + mi	    
	    ;
    
	r.innerHTML = str;
}
/* 교재내용
//변수선언
var now = new Date();
var birth = new Date('December 9, 1991');

//날짜간격구하기
var interval = now.getTime() - before.getTime();
interval = Math.floor(interval / (1000 * 60 * 60 * 24));

Date.prototype.getInterval = function(otherDate){
	//변수를 선언합니다.
	var interval;
}
 */
</script>

</body>
</html>