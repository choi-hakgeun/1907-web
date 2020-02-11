<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>function_declare_2</title>
<style>
div{
border:1px solid #ff0000;
padding:20px;
box-sizing:border-box;
width:400px;
height:150px;
}
</style>
</head>
<body>
<h3>function_declare_2</h3>
<p>
음식이름을 checkbox로 여러개 만들고, 선택된 항목을 div에 출력하도록 각종 함수 선언방식을 사용하여 처리하시오.(function_declare_2.jsp)</br>
1) 익명형</br>
2) callback 함수식</br>
3) 함수식</br>
4) 선언적 함수식</br>
5) 화살표 함수식</br>
</p>

<form id='frm'>
  <label><input type='checkbox' name=chk value='한식' />한식</label>
  <label><input type='checkbox' name=chk value='양식' />양식</label>
  <label><input type='checkbox' name=chk value='중식' />중식</label>
  <label><input type='checkbox' name=chk value='일식' />일식</label>
  <p/>
  <input type='button' value='익명형'          name='btn1' />
  <input type='button' value='callback 함수식' name='btn2' />
  <input type='button' value='함수식'          name='btn3' />
  <input type='button' value='선언적 함수식'   name='btn4' />
  <input type='button' value='화살표 함수식'   name='btn5' /> 
</form>

<h4>함수결과</h4>
<div id='result'></div>

<script>
let str = '';
let r = document.getElementById('result');
let chk = [];
//공통 호출 함수-----------------
function Gen(){
	chk.length = 0; //배열의 초기화
	for(v of frm.chk){ //v에는 checkbox 자체가 대입
		if(v.checked){
			chk.push(v.value);
		}
	}
	return chk;
}
//즉시실행 함수----
( function(){
	str = '즉시 실행 함수 : ' +Gen();
	r.innerHTML = str;
}() );

//익명형
/*  
 강사님코드
 frm.btn1.onclick = function(){
	 str = '<li>익명함수 : '+chk;
	 r.innerHTML = str;
} */

 frm.btn1.onclick = function(){
	for(x in frm.chk){
		if(frm.chk[x].checked){
			chk.push(frm.chk[x].value);
		}
	}
	str = '<li>익명함수 : '+chk;
	r.innerHTML = str;
} 
//callback 함수--------
 /* 강사님 코드
 frm.btn2.onclick = abc;
  */
 
 frm.btn2.onclick = abc;
    function abc(){    	
	for(x in frm.chk){
		if(frm.chk[x].checked){
			chk.push(frm.chk[x].value);
		}
	} 
	str = '<li>callback 함수식 : ' +chk;
	r.innerHTML = str;
 }

//함수식
let func = function(){
	chk.length = 0; //배열의 초기화
	for(v of frm.chk){
		if(v.checked){
			food.push(v.value);
		}
	}
	str = '함수식 : ' +chk;
	r. innerHTML = str;
}
frm.btn3.onclick = func;

//선언적 함수-------------------
//호출되는 function Gen{}의 유형이 선언적 함수.
frm.btn4.onclick = function(){
	str = '선언적 함수 : ' + Gen();
	r.innerHTML = str;
}

//화살표 함수----------------------
//()=>{  }
let arrow = ()=>{
	str = 'arrow 함수 : ' +Gen();
	r.innerHTML = str;
}

frm.btn5.onclick = arrow;
</script>

</body>
</html>