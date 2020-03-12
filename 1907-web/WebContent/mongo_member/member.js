/**
 * http://usejsdoc.org/
 */

let btnFunc = function(){
	if( $('#btnFind')!=null){
		$('#btnFind').click(function(){
			$('#frm').attr('action', 'select.jsp').submit();
		})
	}	
	if( $('#btnInsert')!=null){
		$('#btnInsert').click(function(){
			$('#frm').attr('action', 'insert.jsp').submit();
		})
	}
	if( $('#btnList')!=null){
		$('#btnList').click(function(){
			$('#frm').attr('action', 'select.jsp').submit();
		})
	}
	if( $('#btnRegister')!=null){
		$('#btnRegister').click(function(){
			$('#frm').attr('action', 'insert_result.jsp').submit();
		})
	}
	if( $('#btnDelete')!=null){
		$('#btnDelete').click(function(){
			let yn = confirm("정말???");
			if(yn){
				$('#frm').attr('action', 'delete_result.jsp').submit();				
			}
		});
	}
	
	if( $('#btnModify')!=null){
		$('#btnModify').click(function(){
			$('#frm').attr('action', 'modify.jsp').submit();
		})
	}	
	if( $('#btnUpdate')!=null){
		$('#btnUpdate').click(function(){
			$('#frm').attr('action', 'modify_result.jsp').submit();
		})
	}	
}
let insert = function(){
	btnFunc();
	frm.rDate.valueAsDate = new Date();
}

let view = function(mId){
	frm.mId.value = mId;
	frm.method = 'post';
	$('#frm').attr('action', 'view.jsp').submit();
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