<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>array sort</title>
</head>
<body>
	<h3>배열 정렬</h3>
	<script>
 let array1 = [123,3,213,21,321,321,3];
 let array2 = ['a', '23', 'q23', 'asth','t7u45', '78sd', 'xvz'];
 
 console.log('array1 정렬전 : ', array1);
 console.log('array2 정렬전 : ', array2);
 
 array1.sort();
 array2.sort();//무조건 문자형태로 정렬된다.
 
 console.log('array1 정렬후 : ', array1);
 console.log('array2 정렬후 : ', array2);
 
 array1.sort( 
   function numAsc(left, right){
	 return left-right;
   }
 );
 console.log('array1 숫자정렬후 : ', array1);
 array1.reverse();
 console.log('array1 숫자정렬후 reverse : ', array1);
 
 console.log('join : ', array1.join('----->'));
 
 //object형 데이터를 배열에 저장한 후 원하는 키로 정렬
 function Data(id, score){
	 this.id = id;
	 this.score = score;
 }
 let array3 = [];
 array3.push( new Data('1',  60)  );
 array3.push( new Data('19', 70)  );
 array3.push( new Data('6',  30)  );
 array3.push( new Data('2',  10)  );
 array3.push( new Data('23', 90)  );
 array3.push( new Data('8',  50)  );
 
 //id순으로 오름차 정렬 
 function IdSort(obj1, obj2){
	 let r = ( obj1.id > obj2.id )? 1 :-1;
	 return r;
 }
 function scoreSort(obj1, obj2){
	 return Number(obj1.score) - Number(obj2.score);
 }
 
 array3.sort(scoreSort);
 console.log('-------------------------');
 for(d of array3){
	 console.log(d.id + ' : ' + d.score);
 }
 array3.sort(IdSort);
 console.log('object sort-----------------------');
 for( d of array3){
	 console.log(d.id + ':' +d.score);
 }
 
 //배열 요소 삭제
   let array4 = [324,434,324,324,34,32,4,24,324,32];
   console.log('삭제전 : ', array4);
 for(i = array4.length-1 ; i>-1; i--){ 
	 if(array4[i]>100){
	   array4.splice(i, 1);
	 }
 }
 console.log('삭제후 : ', array4);
</script>

</body>
</html>