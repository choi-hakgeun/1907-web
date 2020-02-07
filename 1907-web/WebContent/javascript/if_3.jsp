<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if(III)</title>
<style>
#info{
  border:2px outset #7777ff;
  padding:10px;
  box-sizing:border-box;
  border-left-width:30px;
  box-shadow:3px 3px 6px #999;
}
form{
   margin-left:30px;
}
form>.c1{
  display:inline-block;
  width:
}
</style>
</head>
<body>
<h3>if(III)</h3>
<p id='info'>
 키와 몸무게를 입력받아 키가 120미만이거나 몸무게가 100kg이상이면
 라디오 버튼중 탑승불가 버튼을, 아니면 탑승가능 버튼이 체크되도록 조치하시오.
</p>
<form name='frm'>
<label>키</label>
<input type='text' size='7' name='height' /><br/>
<label>몸무게</label>
<input type='text' size='7' name='weight' /><p/>
<input type='button' value='확인' name='btn' />
<p/>
<h4>결과</h4>
<label><input type='radio' name='chk' value='탑승가능' >탑승가능</label>
<label><input type='radio' name='chk' value='탑승불가' >탑승불가</label>
</form>
<script>
frm.btn.onclick=function(){
	let h = Number(frm.height.value);
	let w = Number(frm.weight.value);
	if(h<120 || w>=100){
		frm.chk[1].checked=true;
	}else{
		frm.chk[0].checked=true;
	}
}
</script>

</body>
</html>