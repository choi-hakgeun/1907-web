<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selector_find</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<div id='result'>

</div>
<script>
let xml = '<friends>'
        + '    <friend>'
        + '         <name>hong</name>'
        + '         <language>Ruby</language>'
        + '    </friend>'
        + '    <friend>'
        + '         <name>kim</name>'
        + '         <language>Javascript</language>'
        + '    </friend>'
        + '    <friend>'
        + '         <name>park</name>'
        + '         <language>Java</language>'
        + '    </friend>'
        + '</friends>';
        
let xmlDoc = $.parseXML(xml);

$(xmlDoc).find('friend').each(function(index, item){
	let output='';
	output +='<div>';
	output +='    <h1>' + $(this).find('name').text() + '<h1>';
	output +='    <p>' + $(this).find('languge').text() + '</p>';
	output +='</div>';
	$('#result').innerHTML += output;
})
$('#result')

</script>

</body>
</html>