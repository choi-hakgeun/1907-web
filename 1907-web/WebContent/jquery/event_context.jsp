<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event_context</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>
    *{ margin:0px; padding:0px;}
    div{
        margin:5px; padding:3px;
        border :3px solid black;
        border-radius:10px;
    }
</style>
</head>
<body>
	<div>
		<h1>Header 1</h1>
		<p>Paragraph</p>		
	</div>
	<div>
		<h1>Header 2</h1>
		<p>Paragraph</p>		
	</div>
	<div>
		<h1>Header 3</h1>
		<p>Paragraph</p>		
	</div>

<script>
    $(document).ready(function(){
    	//이벤트를 연결합니다.
    	$('div').click(function (){
    		//변수를 선언합니다.
    		var header = $('h1',this).text();
    		var paragraph = $('p', this).text();
    		
    		//출력합니다.
    		alert(header + '\n' + paragraph);
    	});
    });
</script>

</body>
</html>