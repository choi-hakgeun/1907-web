<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>image_preview_3</title>
</head>
<body>
<h3>첨부 이미지 동적 삽입/삭제</h3>
<style>
#att_file{
	border:1px solid #0000ff;
	padding:10px;
	box-sizing:border-box;
	width:600px;
}
#att_file>div{
	position : relative;
	display : inline-block;
	margin : 3px;
}
#att_file .btnDel{
	position:absolute;
	right:2px;
	bottom:2px;
	width:40px;
	height:40px;
	font-size:34px;
	border:0px solid #ffffff;
	opacity:0.3;	
}

</style>
<form name='frm'>
	<label>첨부 이미지</label>
	<div id='att_file'></div>
</form>
<script>
let main = document.getElementById('att_file');
let cnt = 0;
makeDiv(main);

function makeDiv(main){
	let div = document.createElement('div');
	div.setAttribute('style', 'border:1px solid #f00; width:120px; height:180px');
	
	let img = document.createElement('img');
	img.setAttribute('name', 'img'+cnt);
	img.setAttribute('width', '120px');
	img.setAttribute('height', '180px');
	img.src = 'http://placehold.it/120x180';
	div.appendChild(img);
	
	//삭제 버튼
	let btnDel = document.createElement('input');
	btnDel.setAttribute('name', 'btnDel' + cnt);
	btnDel.setAttribute('type', 'button');
	btnDel.setAttribute('value', 'x');
	btnDel.setAttribute('class', 'btnDel');
	btnDel.onclick = function(ev){
		let obj = ev.srcElement;
		let parent = obj.parentNode;
		let tag = parent.getElementsByTagName('input')[1];
		if(tag.getAttribute('modify')=='yes'){
			main.removeChild(parent);
		}
	}
	
	div.appendChild(btnDel);
	
	
	
	//이미지당 file tag
	let file = document.createElement('input');
	file.setAttribute('type', 'file');
	file.setAttribute('name', 'attFile'+cnt);
	file.setAttribute('style', 'display:none');
	file.setAttribute('modify', 'no');
	
	div.appendChild(file);
	
	//이미지를 클릭하면
	img.onclick = function(){
		file.click();
	}
	
	file.onclick = function (event){		
		let btn = event.srcElement;
		btn.onchange = function(){
	    	let url = btn.files[0];
			let reader = new FileReader();
			reader.readAsDataURL(url);		
			reader.onload = function(ev){				
				let temp = new Image();
				temp.src = ev.target.result;
				img.src = temp.src;
			}
			if(file.getAttribute('modify') =='no'){
				makeDiv(main);				
			}
			file.setAttribute('modify', 'yes');
		}
	}

	
	main.appendChild(div);
	cnt++;
}

</script>

</body>
</html>