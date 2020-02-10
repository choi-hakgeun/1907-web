<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>switch2</title>
</head>
<body>
<h3>switch2</h3>
<p id='info'>
 성적을 입력받아 학점을 구하여 성적과 학점을 div에 출력.
</p>

<form name='frm'>
    <label>성적</label>
    <input type='text' name='score' value ='80' />
    <input type='button' value='학점구하기' name='btn' />
</form>
<div id='result'></div>

<script>
let r = document.getElementById('result');
let str = '';
frm.btn.onclick = function(){
	let s = Number(frm.score.value);
	str = '<li> 성적 : ' + s 
	    + '<li> 학점 : ';
	
	switch(true){
		case s>=90 :
			str += 'A';
		    break;
		case s>=80 :
			str += 'B';
		    break;
		case s>=70 :
			str += 'C';
		    break;
		default :
			str += 'D';
		    break;
	}
	r.innerHTML = str;
	
	let color = (s>=60)? '#aaaaff' : '#ffaaaa';
	r.style.backgroundColor = color;
}
</script>
</body>
</html>