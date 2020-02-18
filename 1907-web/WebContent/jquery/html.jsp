<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>html</title>
</head>
<body>
<h3>html</h3>
    <h1>Header-0</h1>
    <h1>Header-1</h1>
    <h1>Header-2</h1>
    
<script>
    $(document).ready(function(){
    	$('div').html(function (index){
    		return '<h1>Header-' + index + '</h1>';
    	});
    });
</script>

</body>
</html>