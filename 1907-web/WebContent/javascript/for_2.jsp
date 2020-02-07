<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for_2</title>
<style>
#info{
  border:2px outset #7777ff;
  padding:10px;
  box-sizing:border=box;
  border-left-width:30px
  box-shadow:3px 3px 6px #999;
}
form{
    margin-left:30px;
}
#result{
    margin:20px;
    width:400px; height:1000px;
    border: 9px inset #4444ff;
    border-radius:10px
    padding:30px;
    box-sizing:border-box;
    box-shadow:3px 3px 4px #aaa;
    overflow:auto;
}
#result>div{
  padding:20px;
  font-weight:bold;
  font-size:1.5em;
}
#result>div:nth-child(2n){
    background-color :#ff9999;
    margin-botton:10px;
}
#result>div:nth-child(2n-1){
    background-color :#9999ff;
    margin-botton:10px;
}
</style>

</head>
<body>
<h3>구구단</h3>
<p id='info'>
1)2~9단까지 구구단을 출력하시오.</br>
2)홀수단의 배경색과 짝수단의 배경색을 서로 다르게 처리하시오.</br>
3)출력 결과는 div에 출력하고 길이가 정해진 길이보다 길어지면 div에 스크롤바를 표시하시오.</br>
</p>
<form name='frm'>
    <label>구구단</label>
    <input type='button' value='RUN' name='btn'/>    
</form>
<div id='result'></div>
<script>
    let sum = 0;
    let str = '';
    let r = document.getElementById('result');
    for(dan=2; dan<=9; dan++){
    	str +='<div>'
    	for(i=1; i<=9; i++){
    		sum = dan * i; 
            str += dan +' * '+ i + ' = ' + sum + '</br>'; 
    	}
    	str += '</div>';
    }
    r.innerHTML=str;

    
</script>
</body>
</html>