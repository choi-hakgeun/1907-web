<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_complete</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>
#sel { width : 166px; }
.sel { display : none; }
</style>
</head>
<body>
<h3>사원정보조회(자동완성기능)</h3>
<form name='frm' id='frm'>
	<input type='text' name='findStr' id='findStr' value='k' tabindex="10">
	<input type='button' value='검색' name='btn' id='btn' >
	<br/>
	<select name='sel' id='sel' class='sel' size='20' tabindex="11"></select>
</form>
<script>
	$('#btn').click(function(){
		$('#findStr').keyup();
	});
	
	$('#findStr').keyup(function(){
		let param = $('#frm').serialize();
		$.getJSON('emp_select_result.jsp', param, function(json){
			frm.sel.length=0;
			if(json.length>0){
				$('#sel').removeClass();
			}else{
				$('#sel').addClass('sal');
			}
			for(i=0; i<json.length; i++){
				let d = json[i];
				let op = new Option(d.eid+"("+ d.fn +")", d.fn);
				frm.sel.options[i] = op;
			}
			frm.sel[0].selectdIndex=0;
		})
	})
	
	$('#sel').dblclick(function(){
		let temp = $(this).val();		
		$('#findStr').val(temp);
		
	})
		
</script>

</body>
</html>