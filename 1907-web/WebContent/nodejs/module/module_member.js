/**
 * module_member.js
 * date : 2020.02.26
 */
let array = [];

exports.Data = function(id, name, phone, address){
	this.id = id;
	this.name = name;
	this.phone = phone;
	this.address = address;	
}

exports.input = function(Data){
	array.push(data);
}
exports.output = function(){
	for(d of array){
		console.log(array.id);
		console.log(array.name);
		console.log(array.phone);
		console.log(array.address);
		console.log("------------------------");
	}
	
}
exports.select = function(id){
	let i = (array.indexOf("id")!==-1)
	console.log(array[i].id);
	console.log(array[i].name);
	console.log(array[i].phone);
	console.log(array[i].address);
	
	/*for(let i=0; i<array.length ; i++){
		if(id == array.id){
			console.log
		}		
	}*/
	
}