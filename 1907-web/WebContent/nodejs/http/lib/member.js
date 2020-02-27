/**
 * http://usejsdoc.org/
 */

let btnFunc = function(){
	if( $('#btnList')!=null){
		$('#btnList').click(function(){
			location.href='select.html';
		})
	}
	
	if( $('#btnInsert')!=null){
		$('#btnInsert').click(function(){
			location.href='insert_form.html';
		})
	}
	if( $('#btnRegister')!=null){
		$('#btnRegister').click(function(){
			location.href='insert_result.html';
		})
	}
	if( $('#btnModify')!=null){
		$('#btnModify').click(function(){
			location.href='modify_form.html';
		})
	}
	
	if( $('#btnUpdate')!=null){
		$('#btnUpdate').click(function(){
			location.href='modify_result.html';
		})
	}	
	if( $('#btnDelete')!=null){
		$('#btnDelete').click(function(){
			let yn = confirm("정말???");
			if(yn){
				location.href='delete_result.html';				
			}
		});
	}
	
}

let selectOne = function(mId){
	btnFunc();	
}
let select = function(){
	btnFunc();	
}

let insert = function(){
	btnFunc();
	trm.rDate.valueAsDate = new Date();
}
let view = function(mId){
	location.href = 'view.html';
}

let update = function(){
	btnFunc();	
}

let deleteF = function(mId){
	btnFunc();	
}

let modify = function(mId){
	btnFunc();	
}