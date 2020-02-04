<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>storage_form</title>
</head>
<body>
<h3>폼정보를 storage에 저장후 재 설정하기</h3>
<form name='frm'>
    <label>아이디</label>
    <input type='text' name='mId'/><br/>
    <label>성별</label>
    <label><input type='radio' name='gender' value='m'>남자</label>
    <label><input type='radio' name='gender' value='f'>여자</label>
    <br/>
    <label>취미</label>
    <label><input type='checkbox' name='hobby' value='축구'>축구</label>
    <label><input type='checkbox' name='hobby' value='야구'>야구</label>
    <label><input type='checkbox' name='hobby' value='농구'>농구</label>
    <label><input type='checkbox' name='hobby' value='배구'>배구</label>
    <br/>
    <label>과정선택</label>
    <select size='1' name='subject'>
    	<option value='java'>java</option>
    	<option value='html'>html</option>
    	<option value='css'>css</option>
    	<option value='javascript'>javascript</option>
    </select>
    <p/>
    <input type='button' value='SAVE' name='btnSave'/>
</form>
<script>
//저장된 object를 가져다 form 상태값을 변경
let obj = localStorage.getItem("data");
if(obj != null){
	let d = JSON.parse(obj);
	frm.mId.value = d.mId;
	
	if(d.gender == 'm'){
		frm.gender[0].checked=true;
	}else{
		frm.gender[1].checked=false;
	}
	
	for(i=0; i<frm.hobby.length; i++){
		for(j=0; j<d.hobby.length; j++){
			if(frm.hobby[i].value == d.hobby[j]){
				frm.hobby[i].checked = true;
				break;
			}
		}
	}
	for(i=0; i<frm.subject.length; i++){
		if(frm.subject[i].value == d.subject){
			frm.subject.selectedIndex = i;
		}
	}
}



frm.btnSave.onclick = function(){
	let mId = frm.mId.value;
	let gender;
	let hobby = []; //배열선언(Json type)
	let subject;
	
	if(frm.gender[0].checked) gender = frm.gender[0].value;
	else					  gender = frm.gender[1].value;
	
	for(i=0; i<frm.hobby.length; i++){
		if(frm.hobby[i].checked)hobby.push(frm.hobby[i].value);
	}
	subject = frm.subject.value;
	
	//object 생성
	let d = new Data(mId, gender, hobby, subject);
	let s = JSON.stringify(d);
	console.log('save data', s);
	localStorage.setItem('data',s);
}
function Data(mId, gender, hobby, subject){
	this.mId = mId;
	this.gender = gender;
	this.hobby = hobby;
	this.subject = subject;
}
</script>

</body>
</html>