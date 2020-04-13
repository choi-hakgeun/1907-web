<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id='mybatis'>
	<p>${msg }</p>
	<form name='frm' method='post'>
	    <input type='text' name='findStr' value='${(empty p.findStr)? param.findStr : p.findStr }'> <%-- ${param.findStr } -> ${p.findStr } 엔크타입으로 넘기기때문에 파라메터로 받을수 없음(?)--%>
	    <input type='text' name='nowPage' value='${(empty p.nowPage)? param.nowPage : p.nowPage }'>
	    <input type='button' value='목록으로' id='btnList'>
	</form>
	<script>
	alert('${msg}');
	go('${p.nowPage}');
	</script>
</div>