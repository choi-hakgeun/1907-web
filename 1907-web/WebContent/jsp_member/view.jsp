<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>view</title>
<link rel='stylesheet' type='text/css' href='./jsp_member/member.css'>
<script src='./lib/jquery-3.4.1.js'></script>
<script src='./jsp_member/member.js'></script></head>
<body>
	<div id='member_main'>
		<h3>회원상세보기</h3>
		
		<form name='frm'  method='post' id='frm'>
			<label>아이디</label> 
			<input type='text' name='mId' value='aaa' /> <br /> 
			<label>회원명</label>
			<input type='text' name='mName' value='bbb' /> <br /> 
			<label>등록일</label>
			<input type='date' name='rDate' value='ccc' /> <br />
			<label>학년</label> 
			<select name='grade'>
				<option value='1'>1 학년</option>
				<option value='2'>2 학년</option>
				<option value='3'>3 학년</option>
				<option value='4'>4 학년</option>
				<option value='5'>5 학년</option>
				<option value='6'>6 학년</option>
				<option value='7'>7 학년</option>
				<option value='8'>8 학년</option>
				<option value='9'>9 학년</option>
				<option value='10'>10 학년</option>
			</select>
			<p />
			<input type='button' id='btnModify' value='수정' /> 
			<input type='button' id='btnDelete' value='삭제' />
			<input type='button' id='btnList' value='목록' /> 
			<input type='hidden' name='findStr'	value='' />
		</form>
	<label>이미지 미리보기</label>
	<div id="preview"></div><input type="file" name="" class="inp-img" accept=".gif, .jpg, .png"> <span class="btn-delete">삭제</span>
	<img src='http://placehold.it/150x180' id='photo' class='photo'/>
	</div>
<script>
frm.grade.selectedIndex = 0;
btnFunc();
</script>
<script type="text/javascript">
// 등록 이미지 등록 미리보기
function readInputFile(input) {
    if(input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#preview').html("<img src="+ e.target.result +">");
        }
        reader.readAsDataURL(input.files[0]);
    }
}
 
$(".inp-img").on('change', function(){
    readInputFile(this);
});
 
 
// 등록 이미지 삭제 ( input file reset )
function resetInputFile($input, $preview) {
    var agent = navigator.userAgent.toLowerCase();
    if((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1)) {
        // ie 일때
        $input.replaceWith($input.clone(true));
        $preview.empty();
    } else {
        //other
        $input.val("");
        $preview.empty();
    }       
}
 
$(".btn-delete").click(function(event) {
    var $input = $(".inp-img");
    var $preview = $('#preview');
    resetInputFile($input, $preview);
});
</script>
</body>
</body>
</html>