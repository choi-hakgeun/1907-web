<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event_one</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3>event_one</h3>
    <h1>Header-0</h1>
    <h1>Header-1</h1>
    <h1>Header-2</h1>

<script>
    $(document).ready(function(){
    	//이벤트를 연결합니다.
    	$('h1').one('click', function () {
    		$(this).html(function (index, html){
    			return html + '+';
    		});
    	});
    	
    	//이벤트를 연결합니다.
    	$('h1').one({
    		mouseenter : function () { $(this).addClass('reverse');},
    		mouseleave : function () { $(this).removeClass('reverse');}
    	});
    });
</script>

</body>
</html>