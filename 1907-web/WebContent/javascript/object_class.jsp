<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>object_class</title>
<h3>class를 사용한 객체 생성</h3>
<script>
class Member{
	constructor(id, name, phone){
		this.id = id;
		this.name = name;
		this.phone = phone;
	}
	
	setId(id) {this.id=id;}
	setName(name){ this.name = name;}
	setPhone(phone){this.phone = phone;}
	
	getId(){ return this.id };
	getName(){ return this.name };
	getPhone(){ return this.phone };
	
	toString(){
		let str = this.id +':'
		        + this.name +':'
		        + this.phone;
		return str;
	}
	toJSON(){
		let str={
		'id'    : this.id,
		'name'  : this.name,
		'phone' : this.phone			
		}
	    return str;
	};
	toHTML(){
		let str = `<div>
		<span>\${this.id}</span>
		<span>\${this.name}</span>
		<span>\${this.phone}</span>
		</div>`;
		return str
	}
}
//객체를 생성하여 배열에 저장후 console에 출력
let array = [];
array.push(new Member('a001', 'hong', '02-1234-1111'));
array.push(new Member('a002', 'kim', '02-1234-2222'));
array.push(new Member('a003', 'choi', '02-1234-3333'));
array.push(new Member('a004', 'park', '02-1234-4444'));

console.log('toString()---------------');
for(m of array){
	console.log(m.toString());
}
console.log('toSJON()---------------');
for(m of array){
	console.log(m.toJSON());
}
console.log('toHTML()---------------');
for(m of array){
	console.log(m.toHTML());
}
</script>

</head>
<body>

</body>
</html>