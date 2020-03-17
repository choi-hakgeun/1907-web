/**
 * 
 */
let btnFunc = function(){
	if( $('#btnFind')!=null){
		$('#btnFind').click(function(){
			$('#frm').attr('action', 'select.mm').submit();
		})
	}	
	if( $('#btnInsert')!=null){
		$('#btnInsert').click(function(){
			$('#frm').attr('action', 'insert.mm').submit();
			/*goSubmit(frm, url + 'insert.jsp');*/
		})
	}
	if( $('#btnList')!=null){
		$('#btnList').click(function(){
			$('#frm').attr('action', 'select.mm').submit();			
		})
	}
	if( $('#btnRegister')!=null){
		$('#btnRegister').click(function(){
			$('#frm').attr('action', 'insertR.mm').submit();
		})
	}
	if( $('#btnDelete')!=null){
		$('#btnDelete').click(function(){
			let yn = confirm("정말???");
			if(yn){
				$('#frm').attr('action', 'deleteR.mm').submit();				
			}
		});
	}
	
	if( $('#btnModify')!=null){
		$('#btnModify').click(function(){
			$('#frm').attr('action', 'modify.mm').submit();
		})
	}	
	if( $('#btnUpdate')!=null){
		$('#btnUpdate').click(function(){
			$('#frm').attr('action', 'modifyR.mm').submit();
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
	$('#frm').attr('action', 'view.mm').submit();
}