<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_font</title>
<style>
#font_size>#px{
  font-size:30px;
}
#font_size>#em{
  font-size:2em;
}
#font_size>#per{
  font-size:300%
}
#line_height{
  border:2px solid #0000ff;
  padding:10px;
  box-sizing : border-box;
  width:300px;
  line-height:1.5em;
  letter-spacing:2px;
}
#text_overflow>div{
  border:1px solid #0000ff;
  width:200px;
  margin-top:10px; 
  white-space:nowrap; 
}
#text_overflow>#div1{
text-overflow: ellipsis;
overflow:hidden;
}
#text_overflow>#div2{
text-overflow: clip;
overflow:hidden;
}
#text_overflow>#div3{
  overflow:auto;
}
#text_overflow>#div5{
  white-space: normal;
}
#text_shadow{
  font-size:5em;
  font-weight:bold;
  text-shadow:3px 3px 4px #00f;
}

</style>
</head>
<body>
<h3>font</h3>
<div id='font_size'>
  <div>기본 크기 123 가나다</div>
  <div id='px'>PX 123 가나다</div>
  <div id='em'>EM 123 가나다</div>
  <div id='per'>% 123 가나다</div>  
</div>
<div id=line_height'> 
 줄간격 테스트 가나다 123 abc
 줄간격 테스트 가나다 123 abc
 줄간격 테스트 가나다 123 abc
 줄간격 테스트 가나다 123 abc
 줄간격 테스트 가나다 123 abc 
</div>
<div id='text_overflow'>
  <div id='div1'> 매우 매우 긴 문장렬이 들어 있는 제목 입니다.</div>
  <div id='div2'> 매우 매우 긴 문장렬이 들어 있는 제목 입니다.</div>
  <div id='div3'> 매우 매우 긴 문장렬이 들어 있는 제목 입니다.</div>
  <div id='div4'> 매우 매우 긴 문장렬이 들어 있는 제목 입니다.</div>  
  <div id='div5'> 매우 매우 긴 문장렬이 들어 있는 제목 입니다.</div>
</div>

<div id='text_shadow'>
    1907기 화이팅
</div>

</body>
</html>