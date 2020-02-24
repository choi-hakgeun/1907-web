/**
 * 회원관리
 * date : 2020.01.21
 */
let xhr = new XMLHttpRequest();
let findStr='';//화면이 바꾸어도 검색어를 유지하기 휘한 변수

/*
 * member_main 을 처름으로 호출했을 때와 목록 버튼이 클릭된 경우
 * 검색폼과 목록을 표시하기 위해
 */
let init = function(){
	$.get('member_select.jsp', function(data){
		$('#form').html(data); //검색 폼 표시
		
		// 검색 버튼이 클릭된 경우 목록을 가져와 표시
		$('#btnFind').click(function(){
			findStr = $('#findStr').val();
			select();		
		});
	});
}

let select = function(){
	// 검색어 정보 유지	
	$.get('member_select_result.jsp?findStr=' + findStr, function(data1){
		let json = JSON.parse(data1);
		let data = '';
		for(d of json){
			data += "<div class='item' <a onclick=\"view('" + d.mId + "')\">" 
			+  "<span class='mId'>" + d.mId + '</span>'
			+  "<span class='mName'>" + d.mName + '</span>'
			+  "<span class='rDate'>" + d.rDate + '</span>'
			+  "<span class='grade'>" + d.grade + '</span>'
			+  '</a></div>';
		}
		$('#result').removeClass('result_ok');
		$('#result').html(data);	
	});
	//엔터키를 눌렀을 때  submit 기능 중지하고 검색 버튼에 클릭 이벤트 발생
	$('#frm').submit(function(){
		$('#btnFind').click();
		return false;
	})
	// 회원추가 버튼이 클릭된 경우
	$('#btnInsert').click(function(){
	$.get('member_insert.jsp', function(data){
		$('#form').html(data);
		$('#result').html('');		
		});
	});
};

// 회원가입 폼에서 등록 버튼이 클릭된 경우
let insert = function(){
	frm.rDate.valueAsDate = new Date();
	$('#btnRegister').click(function(){
		let param = $('#frm').serialize();		
		$.post('member_insert_result.jsp', param, function(data){
			$('#result').html(data);
			$('#mId').val('');
			$('#mName').val('');
			$('#grade').selectedIndex=0;
			$('#mId').focus();
			$('#result').addClass('result_ok');			
		});				
	});
	
	$('#btnList').click(function(){
			init();
	})
}

// 목록화면에서 항목을 클릭한 경우 상세보기로 이동
let view = function(mId){
	$.get('member_view.jsp', function(data){
		
		$('#form').html(data);
		$('#result').html("");
		
		$.post('member_get.jsp', "mId="+mId, function(data){
			let json = JSON.parse(data);
			frm.mId.value = json.mId;
			frm.mName.value = json.mName;
			frm.rDate.value = json.rDate;
			frm.grade.value = json.grade;
			
		});			
		
		$('#btnList').click(function(){
			init();
		});
		
		$('#btnModify').click(function(){
			modify(mId);
		});
		
		
		$('#btnDelete').click(function(){
			let yn = confirm("정말 ???");
			if(yn){
				deleteF(mId);
				init();
			}else{
				$('#result').html("삭제가 취소됨....");
			};
		});
	});	
}

// 회원정보 수정화면에서 정보수정 버튼이 클릭된 경우
let update = function(){
	let param = $('#frm').serialize();
	
	$.post('member_modify_result.jsp', param, function(data){
		$('#result').html(data);
		$('#result').addClass('result_ok');		
	});
}

// 삭제버튼이 클릭된 경우
let deleteF = function(mId){
	let param = "mId=" + mId;
	$.post('member_delete_result.jsp', param, function(data){
		alert(data);
		select();
	});
}

//상세보기 화면에서 수정 버튼이 클릭된 경우
let modify = function(mId){
	let param = 'mId=' + mId;
	$.post('member_modify.jsp', param, function(data){
		$('#form').html(data);
		$('#result').html('');
		
		$.post('member_get.jsp?mId='+mId, function(data){
			let json = JSON.parse(data);
			frm.mId.value = json.mId;
			frm.mName.value = json.mName;
			frm.rDate.value = json.rDate;
			frm.grade[json.grade-1].selected = true;			
		});			
		$('#btnUpdate').click(function(){
			$('#result').html("수정됨")
			update();
		})
		
		$('#btnList').click(function(){
			init();
		})
	});
}