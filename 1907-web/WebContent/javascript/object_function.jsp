<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>object_function</title>
</head>
<body>
	<h3>function을 사용한 객체 생성</h3>
	<p id='info'>
		function ABC( [매개변수] ){...}<br /> let obj = new ABC();
	<P />
	<script>
		function Student(id, name, phone) {
			this.id = id;
			this.name = name;
			this.phone = phone;

			this.setId = function(id) {
				this.id = id;
			};
			this.setName = function(name) {
				this.name = name;
			};
			this.setPhone = function(phone) {
				this.phone = phone;
			};
			this.getId = function() {
				return this.id;
			};
			this.getName = function() {
				return this.name;
			};
			this.getPhone = function() {
				return this.phone;
			};
			this.toString = function() {
				let str = this.id + ':' 
				        + this.name + ' : ' 
				        + this.phone;
				return str;
			}
			
			this.toJSON = function(){
				let str = { 'id'   : this.id, 
							'name' : this.name,
							'phone': this.phone
				};
				return str;
			}
			this.toHTML = function(){
				let str = '<div><span>' + this.id + '</span>'
				        + '<span>'+ this.name +'</span>'
				        + '<span>' + this.phone + '</span></div>';
				        return str;
			}
		}

		let s1 = new Student();
		s1.setId('aaa');
		s1.setName('길동이');
		s1.setPhone('010-1111-1111');
		console.log(s1.toString());
		console.log(s1.toJSON());
		console.log(s1.toHTML());
		
		let s2 = new Student('bbbb', '춘향이', '010-2222-2222');
		console.log(s1.toJSON());
		console.log(s1.toHTML());
		
		let array = [] // array = new Array()
		array.push(s1);
		array.push(s2);
		
		console.log('----------------------------');
		for(i=0; i<array.length; i++){
			console.log(array[i].toJSON());
		}
	</script>

</body>
</html>