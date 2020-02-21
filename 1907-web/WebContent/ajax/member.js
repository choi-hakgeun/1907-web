/**
 * 회원관리
 * date : 2020.02.21 
 */
let xhr = new XMLHttpRequest();

let init = function(){
	xhr.open('get', 'member_select.jsp');
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.status==200 && xhr.readyState==4){
			$('#result').html(xhr.responseText);
		}
	}
}

let init = function(){
	xhr.open('get', 'member_select_result.jsp');
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.status==200 && xhr.readyState==4){
			let json = JSON.parse(xhr.responseText);
			let data = ' ';
			for( d of json){
				data +="<div class='item'>"
					 + " <span class='mId'>" + d.mId +"</span>"
					 + " <span class='mName'>" + d.mName +"</span>"
					 + " <span class='rDate'>" + d.rDate +"</span>"
					 + " <span class='grade'>" + d.grade +"</span>"
					 + " </div> "
			}
			$('#result').html(str);
		}
	}
}
if( $('#btnFind') != null){
	$('#btnFind').click(function(){
		select();
	})	
}