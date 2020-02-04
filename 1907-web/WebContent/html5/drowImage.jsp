<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>drawImage</title>
<style>
#can {border:2px solid #9999ff}
</style>
</head>
<body>
<h3>drowImage</h3>
<canvas id='can' width='500px' height='400px'></canvas>
<br/>
<label>확대 축소</label>
<form name='frm'>
	<input type='range' name='rate' min='-1' max='1' step='0.1' />
</form>
<script>
let ctx = document.getElementById('can').getContext('2d');
frm.rate.onchange = view; //function view를 실행해라.(call back)
view();
function view(){	
	let img = new Image(); // <img />
	img.src = '../images/test.png';
	ctx.clearRect(0,0, 500, 400);
	ctx.drawImage(img, 0,0);
	let w = img.width + (img.width * frm.rate.value);
	let h = img.height + (img.height * frm.rate.value);
	ctx.drawImage(img, 0,0, img.width, img.height, img.width+10, 0, w, h);
}
</script>

</body>
</html>