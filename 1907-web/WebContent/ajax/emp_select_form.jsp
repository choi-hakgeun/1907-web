<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_select_form</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>
#title{
	padding-bottom:5px;
	border-bottom:2px solid #aaf;
	width:600px;
	font-size:.9em;
}
#result{
	width:600px;
}
div>span{
	display: inline-block;
	font-size:.9em;
}
#result>div:hover{
	background: #eee;
	font-weight:bold;
}
#result>div:nth-child(5n){
	border-bottom:0.5px solid #ddd;
}
#result>div:last-child{
	border-bottom:2px solid #aaf;
}


.no{  width: 60px}
.eid{ width: 60px}
.fn{  width: 130px}
.sal{ width: 70px; text-align:right}
.did{ width: 60px;margin-left:20px;}
.dname{ width: 150px}

#frm{
	width:600px;
	text-align: right;
	margin-bottom:10px;
}
</style>
</head>
<body>
<h3>사원조회</h3>
<form name='frm' id='frm'>
	<input type='text' name='findStr' id='findStr'>
	<input type='button' value='검색' id='btnFind'>
</form>
<div id='title'>
	<span class='no'>No</span>
	<span class='eid'>사번</span>
	<span class='fn'>성명</span>
	<span class='sal'>급여</span>
	<span class='did'>코드</span>
	<span class='dname'>부서명</span>
</div>
<div id='result'></div>
</body>
<script>
$('#frm').submit(function(){
	$('#btnFind').click();
	return false;
});

$('#btnFind').click(function(){
	let v = $('#findStr').val();
	let url = 'emp_select_result.jsp?findStr=' + v;
	let xhr = new XMLHttpRequest();
	xhr.open('get', url);
	xhr.send();
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
			let temp = xhr.responseText;
			let data = JSON.parse(temp);
			let str = '';
			for(d of data){
				str += 
					`<div class='item'>
			       <span class='no'>\${d.no}</span>
			       <span class='eid'>\${d.eid}</span>
			       <span class='fn'>\${d.fn}</span>
			       <span class='sal'>\${d.sal}</span>
			       <span class='did'>\${d.did}</span>
			       <span class='dname'>\${d.dname}</span>
					 </div>		       
				`;
			}//end for
			$('#result').html(str);
		}// end if
	}
})

</script>
</html>   