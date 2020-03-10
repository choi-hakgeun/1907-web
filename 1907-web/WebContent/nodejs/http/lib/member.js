/**
 * http://usejsdoc.org/
 */

let btnFunc = function(){
	if( $('#btnFind')!=null){
		$('#btnFind').click(function(){
			$('#frm').attr('action', 'select').submit();
		})
	}	
	if( $('#btnInsert')!=null){
		$('#btnInsert').click(function(){
			$('#frm').attr('action', 'insert').submit();
		})
	}
	if( $('#btnList')!=null){
		$('#btnList').click(function(){
			$('#frm').attr('action', 'select').submit();
		})
	}
	if( $('#btnRegister')!=null){
		$('#btnRegister').click(function(){
			$('#frm').attr('action', 'insertR').submit();
		})
	}
	if( $('#btnDelete')!=null){
		$('#btnDelete').click(function(){
			let yn = confirm("정말???");
			if(yn){
				$('#frm').attr('action', 'deleteR').submit();				
			}
		});
	}
	
	if( $('#btnModify')!=null){
		$('#btnModify').click(function(){
			$('#frm').attr('action', 'modify').submit();
		})
	}	
	if( $('#btnUpdate')!=null){
		$('#btnUpdate').click(function(){
			$('#frm').attr('action', 'modifyR').submit();
		})
	}	
}
let insert = function(){
	btnFunc();
	trm.rDate.valueAsDate = new Date();
}

let view = function(mId){
	frm.mId.value = mId;
	frm.method = 'post';
	$('#frm').attr('action', 'view').submit();
}
/*
 let selectOne = function(mId){
	btnFunc();	
}
let select = function(){
	btnFunc();	
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
*/