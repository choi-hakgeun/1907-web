<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xhr_test</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>
div.frame{
	display:inline-block;
	width:300px;
	height:200px;
	border:2px solid #00f;
	overflow:auto;
}
table{
	background-color:#ffffaa;
}
div.item{
	border : 2px solid #00f00f;
	background-color:#f0f0f0;
}
</style>
</head>
<body>
<h3>XMLHttpRequest 객체 Test</h3>
<input type='button' value='Ajax 실행1' id='btn1' />
<input type='button' value='Ajax 실행2' id='btn2' />

<input type='button' value='CSV' id='btn3' />
<input type='button' value='XML' id='btn4' />
<input type='button' value='JSON' id='btn5' />
<p/>
<div id='div1' class='frame'></div> 
<div id='div2' class='frame'></div>
<div id='div3' class='frame'></div>

<script>
//let btn1 = document.getElementById('btn1'); 
//btn1.onclick = function(){  }

let xhr = new XMLHttpRequest();

$('#btn1').click(function(){
	xhr.open('get', 'test1.html', true);
	xhr.send();
	xhr.onreadystatechange=function(){
		//console.log(xhr.status +' , ' + xhr.readyState);
		if(xhr.status==200 && xhr.readyState==4){
			$('#div1').html(xhr.responseText);
		}
	}
	
	
})

$('#btn2').click(function(){
	xhr.onreadystatechange=function(){
		//console.log(xhr.status +' , ' + xhr.readyState);
		if(xhr.status==200 && xhr.readyState==4){
			$('#div2').html(xhr.responseText);
		}
	}
	
	xhr.open('get', 'test2.jsp', true);
	xhr.send();
})

$('#btn3').click(function(){
	xhr.open('get', 'csv.jsp');
	xhr.send();
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
			let array = xhr.responseText.split('\n');
			let str = "<table border='1' width='100%'>"
					+ "<tr><th>사번</th><th>성명</th><th>급여</th>"
					+ "</tr>";
			for(let i=0; i<array.length ; i++){
				
				if(array[i]=='\r' || array[i]=='')continue;
				
				let data=array[i].split(',');
				
				str +="<tr>"
					+ "<td>" + data[0] + "</td>"
					+ "<td>" + data[1] + "</td>"
					+ "<td>" + data[2] + "</td>"
					+ '</tr>'
			}
			str += '</table>';
			$('#div1').html(str);
			
		}
	}
})

$('#btn4').click(function(){
	xhr.open('get', 'xml.jsp');
	xhr.send();
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
			let temp = xhr.responseXML;
			let deps = $(temp).find('department');
			console.log(temp);			
			let str = '';
			$(deps).each(function(){
				str += "<div class='item'>"
					+ "	<span class='id'>"    + $(this).find('id').text()    +"</span>"
					+ "	<span class='dname'>" + $(this).find('dname').text() +"</span>"
					+ " <span class='mid'>"   + $(this).find('mid').text()   + "</span>"
					+ " </div> ";
					
			})
			$('#div2').html(str);
		}
	}
});

$('#btn5').click(function(){
	xhr.open('get', 'json.jsp');
	xhr.send();
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
			let temp = xhr.responseText;
			let data = JSON.parse(temp);
			let str = '';
			str += "<div class='header'>"
				+ "	<span class='id'>사번</span>"
				+ "	<span class='dname'>성명</span>"
				+ " <span class='mid'>매니저</span>"
				+ " </div> ";
			
			for(let i=0; i<data.length ; i++){
				str +="<div class='item'>"
					+ "	<span class='id'>"    + data[i].id  + "</span>"
					+ "	<span class='dname'>" + data[i].fn  + "</span>"
					+ " <span class='mid'>"   + data[i].mid  + "</span>"
					+ " </div> ";
			}
			$('#div3').html(str);
		}		
	}	
})

</script>



</body>
</html>