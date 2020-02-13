<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>
<script src='http://dmaps.daum.net/map_js_init/postcode.v2.js'></script>
</head>
<body>
<h3> 회원가입 </h3>
<form name='frm'>
    <label>우편번호</label>
    <input type ='text' size='7' name='zip' />
    <input type = 'button' value='우편번호검색' name='btn' />
    <input type = 'button' value='다음우편번호검색' name='btn2' />
    <br/>
    <input type='text' size='60' name='address1' /><br/>
    <label>상세주소</label>
    <input type='text' size='40' name='address2' />
</form>
<script>
frm.btn.onclick = function(){
	let w = window.open('zip.jsp', 'w', '');
}

frm.btn2.onclick = function(){ //daum api
	new daum.Postcode({
		oncomplete : function(data){
			frm.zip.value = data.zonecode;
			frm.address1.value = data.address;
		}
	}).open();	
}
</script>


</body>
</html>