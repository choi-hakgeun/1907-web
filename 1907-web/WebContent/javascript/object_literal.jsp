<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>object_literal</title>
</head>
<body>
<h3>literal 을 사용한 객체 생성</h3>
<p id='info'>
let obj={}으로 객체 obj를 생성함.
</p>
<script>
// 기본형
let obj1 = {};
obj1.id='hong';
obj1.name='홍길동';
obj1.kor=90;
obj1.eng=50;
obj1.tot=obj1.kor+obj1.eng;
obj1.avg=obj1.tot/2;
console.log('객체 리터럴을 사용함..............');
console.log('id : ', obj1.id);
console.log('name : ', obj1.name);
console.log('kor : ', obj1.kor);
console.log('eng : ', obj1.eng);
console.log('tot : ', obj1.tot);
console.log('avg : ', obj1.avg);

//메서드가 있는 리터럴 객체
let obj2 = {};
obj2.code = 'a001';
obj2.codeName='새우깡';
obj2.output = function(){
	console.log('메서드가 있는 리터럴 객체...........');
    console.log(obj2.code + ' : ' + obj2.codeName);
}
obj2.setCode=function(code){
	this.code = code;
}
obj2.setCodeName = function(cn){
	this.codeName = cn;
}
obj2.output();
obj2.setCode('b001');
obj2.setCodeName('양파깡');
obj2.output();

//리터럴 객체를 map으로 생성
let obj3 = {		
		'id'      : 'a001',
		'name'    : '홍길동',
		'address' : '서울',
		'phone'   : '010-1111-1111',
		'setId'   : function(id){this.id=id},
		'setName' : function(name){this.name = name}		
}
console.log('리터럴 객체를 map으로 생성');
console.log('id : ', obj3.id);
console.log('name : ', obj3.name);
console.log('address : ', obj3.address);
console.log('phone : ', obj3.phone);
obj3.setId('b001');
obj3.setName('일지매');
console.log('id : ', obj3.id);
console.log('name : ', obj3.name);


</script>
</body>
</html>