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
			$('#frm').removeAttr('enctype');
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
			var pwd = prompt("비밀번호를 입력하세요.");			
			if(pwd != null){
				$('#pwd').val(pwd);			
				$('#frm').attr('action', 'deleteR.mm').submit();				
			}



		});
	}
	if( $('#btnDeleteP')!=null){
		$('#btnDeleteP').click(function(){
			var pwd = prompt("비밀번호를 입력하세요.", "password");
			console.log(pwd);
			if(pwd != null){
				$('#pwd').val(pwd);
				$('#frm').removeAttr('enctype');
			}
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
	if($('#btnPhoto') !=null ){
		$('#btnPhoto').change(function (event){
			let ele = event.target
			let url = ele.files[0];
			
			let reader = new FileReader();
			reader.readAsDataURL(url);
			
			reader.onload = function(e){
				let img = new Image();
				img.src = e.target.result;
				$('#photo').attr('src', img.src);
			}
		})
	}

}
let insert = function(){
	btnFunc();
	frm.rDate.valueAsDate = new Date();
}
let view = function(mId){
	frm.mId.value = mId; //폼테그에 mId라는 값을 넣음
	frm.method = 'post';
	$('#frm').attr('action', 'view.mm').submit();
}
let goPage = function(nowPage){	
	$('#nowPage').val(nowPage);
	$('#frm').attr('action', 'select.mm').submit();
}