<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>storage</title>
</head>
<body>
<h3>storage</h3>
<form name='frm'>
	<output name='mId'></output> 님 방가...<br/>
	<input type='button' value='SAVE' name='btnSave'/>
	<input type='button' value='LODE' name='btnLoad'/>
</form>
<script>
let btn = document.getElementById('btnRun');
// 저장된 색상값을 태그에 적용
//localStorage, sessionStorage에 값을 저장한 후
//브라우저를 종료한 후 그 결과를 조회
frm.mId.value = localStorage.getItem('mId');
frm.btnSave.onclick = function(){
	localStorage.setItem('mId', 'hong');
	sessionStorage.setItem('mId', 'hong');
}
frm.btnLoad.onclick = function(){
	let localId = localStorage.getItem('mId');
	let sessionId = sessionStorage.getItem('mId');
	console.log('localStorage', localId);
	console.log('sessionStorage', sessionId);
}


</script>

</body>
</html>