<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>table</title>
</head>
<body>
<h4>기본구조</h4>
<table border='1'>
<tr>
<td>1</td>
<td>2</td>
<td>3</td>
</tr>
<tr>
<td>4</td>
<td>5</td>
<td>6</td>
</tr>
</table>
<h4>넓이|높이 지정</h4>
<table border='1' width='300px' height='100px'>

<tr align='center'>
<td>1</td>
<td>2</td>
<td>3</td>
</tr>
<tr>
<td>4</td>
<td align='right'>5</td>
<td>6</td>
</tr>
</table>
<h4>회원명단</h4>
<table border='1' width='400px'>
<tr bgcolor='#ccc'>
  <td>번호</td>
  <td>성명</td>
  <td>연락처</td>
</tr>

<tr>
  <td>1</td>
  <td>hong</td>
  <td> 010-1111-1111</td>
</tr>
</table>
<table width='400px' border='1'>
 <tr bgcolor='#bb0'>
 <th> 번호</th>
 <th> 성명</th>
 <th> 연락처</th>
 </tr>
 <tr>
 <td> 1</td>
 <td> hong</td>
 <td> 010-1111-1111</td>
 </tr>  
</table>
<h4>셀의 여백지정</h4>
<table border='1' cellpadding='30px' cellspacing='10px'>
<tr>
  <td>A</td>
  <td>B</td>  
</tr>
<tr>
<td>C</td>
<td>D</td>
</tr>
</table>
<h4>셀병합</h4>
<table border='1' width='300px' cellspacing='0px'>
<tr>
  <td>A</td>
  <td>B</td>  
  <td colspan='2'>C</td>
</tr>
<tr>
<td>D</td>
<td>E</td>
<td>F</td>
<td>G</td>
</tr>
<tr>
<td>H</td>
<td>I</td>
<td colspan='2'>J</td>

</tr>
<tr>
<td colspan='4'>K</td>
<td>L</td>
<td>M</td>
<td>O</td>
</tr>
</table>

<h4>행병합</h4>
<table border='1' width='300px'>
<tr>
  <td >A</td>
  <td>B</td>  
  <td>C</td>
  <td rowspan='4'>D</td>
</tr>
<tr>
<td>E</td>
<td>F</td>
<td>G</td>
</tr>
<tr>
<td>H</td>
<td>I</td>
<td>J</td>

</tr>
<tr>
<td>K</td>
<td>L</td>
<td>M</td>
</tr>
</table>

<h4>frame:hsides</h4>
<table frame='hsides'>
  <tr>
    <td>A</td><td>B</td><td>C</td>
  </tr>
  <tr>
    <td>A</td><td>B</td><td>C</td>
  </tr>
</table>

</body>
</html>