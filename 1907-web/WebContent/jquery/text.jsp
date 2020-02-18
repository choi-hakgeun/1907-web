<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>text</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3>text</h3>
<div>&lt;h1&gt;$().test() Method&lt;/h1&gt;</div>
<div>&lt;h1&gt;$().test() Method&lt;/h1&gt;</div>
<div>&lt;h1&gt;$().test() Method&lt;/h1&gt;</div>
<script>
    $(document).ready(function(){
    	$('div').text('<h1>$().html() Method</h1>');
    });
</script>

</body>
</html>