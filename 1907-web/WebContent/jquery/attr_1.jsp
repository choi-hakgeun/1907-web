<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attr_1</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
    <img src = "../images/abc.png" />

<script>
    $(document).ready(function(){
    	$('img').attr('width', function (index){
    		return (index + 1) *100
    	});
    });
</script>


</body>
</html>