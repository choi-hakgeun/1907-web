<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>array_2</title>
<link rel='styleSheet' type='text/css' href='../css/my_css.css' />
<style>
#result{
  max-height: 370px;
  overflow:auto;
}

form>label{
  display:inline-black;
  width:60px;
  text-align : right;
}
input[type-button].first-child{
  margin-left:66px;
}
table{
  border:0px solid #0000ff;
  width:100%;
}
table tr{
    text-alige:center;
}
table tr:first-child{
  background-color:#aaa;
}
</style>
</head>
<body>
<h3>array_2</h3>
<p id = 'info'>
폼을 사용하여 아이디, 성명, 국어, 영어점수를 입력받아 총점과 평균을 계산하여
하나의 배열에 저장하고, 저장된 내용을 div에 출력하시오.<br/>ex)<br/>
[
  {'id':'part', 'name':'박원기', 'kor':90, 'eng':80, 'tot':170, 'avg':85},
  {'id':'kim', 'name':'김원기', 'kor':90, 'eng':80, 'tot':170, 'avg':85}
]
</p>
<form name='frm'>
<label>아이디</label>
<input type='text' size='10' maxLength='10' name='mId' /><br/>
<label>성명</label>
<input type='text' size='10' maxLength='10' name='irum' /><br/>
<label>국어</label>
<input type='text' size='5' maxLength='10' name='kor' /><br/>
<label>영어</label>
<input type='text' size='5' maxLength='10' name='eng' /><br/>
<label>총점</label>
<input type='text' size='5' maxLength='10' name='tot' readonly/><br/>
<label>평균</label>
<input type='text' size='5' maxLength='10' name='avg' readonly/><br/>
<p/>
<input type='button' value='저장' name='btnSave' />
<input type='button' value='출력' name='btnPrint' />
</form>
<div id='result'></div>
<script>
let array=[];
let r = document.getElementById('result');

frm.btnSave.onclick=function(){
	let id = frm.mId.value;
	let irum = frm.irum.value;
	let kor = Number(frm.kor.value);
	let eng = Number(frm.eng.value);
	let tot = kor+eng;
	let avg = tot/2;
	
	let data = {'id':id, 'irum':irum, 'kor':kor, 'eng':eng, 'tot':tot,'avg':avg};
	
	data = JSON.stringify(frm);
	console.log(data);
	
	array.push(data);
	
	frm.tot.value = tot;
	frm.avg.value = avg;
}
frm.btnPrint.onclick=function(){
    let str = '<table><tr><th>ID</th><th>IRUM</th><th>KOR</th><th>ENG</th>'
        str += '<th>TOT</th><th>AVG</th></tr>';
        
        for(d of array){
        	str +='<tr>';
        	str +=`<td>\${d.id}</td>`; //backtick 사용
        	str +=`<td>\${d.irum}</td>`;
        	str +=`<td>\${d.kor}</td>`;
        	str +=`<td>\${d.eng}</td>`;
        	str +=`<td>\${d.tot}</td>`;
        	str +=`<td>\${d.avg}</td>`;
        	str +='</tr>';
        }
    str += '</table>';
    r.innerHTML = str;
    
    }
// option.. (성적이 바뀌면 바로 tot, avg 계산)
let compute = function(){
	let kor = Number(frm.kor.value);
	let eng = Number(frm.eng.value);
	let tot = kor+eng;
	let avg = tot/2;	
	frm.tot.value = tot;
	frm.avg.value = avg;
}
    
frm.kor.onchange=compute;
frm.eng.onchange=compute;

</script>

</body>
</html>