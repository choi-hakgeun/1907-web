<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selector 2</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3>속성 선택자</h3>
<ul>
	<li>modify=yes : modify가 yes인 요소</li>
	<li>modify!=kr-ko : modify속성이 kr 또는 ko인 요소</li>
	<li>modify~=123 : modify가 123인 단어가 있는 요소</li>
	<li>modify^=123 : modify가 123으로 시작하는 요소</li>
	<li>modify$=123 : modify가 123으로 끝나는 요소</li>
	<li>modify *=123 : modify가 123이 포함되어 있는 요소</li>
</ul>
<div modify='123'>class='123'</div>
<div modify='123 abc 12345 가나다'>modify='123 abc 12345 가나다'</div>
<div modify='123 abc 12345 가나다'>modify='123 abc 12345 가나다'</div>
<div modify='123 abc 12345 가나다'>modify='123 abc 12345 가나다'</div>
<div modify='123 abcd 12345 가나다'>modify='123 abcd 12345 가나다'</div>
<div modify='123 abcd 12345 가나다'>modify='123 abcd 12345 가나다'</div>
<div modify='345'>modify='345'</div>
<div modify='356'>modify='356'</div>
<div modify='kr-ko'>modify='kr-ko'</div>
<div modify='un-kr'>modify='un-kr'</div>

<script>
$(function(){
    $('[modify=123]').css('color', '#ff0000');
    $('[modify~=abc]').css('color', '#0000ff');
    $('[modify*=d]').css('font-weight', 'bold');
    $('[modify$=3]').css('text-decoration', 'underline');
    $('[modify^=3]').css('color','#00ff00');
    $('[modify|=kr]').css('color','#ffff00');
})
</script>

</body>
</html>
