/**
 * 
 */
let getId = function(id){ return document.getElementById(id)}
let url = "./index_mybatis.jsp?inc=./mybatis/";
let btnFunc = function(){
	
	if(getId('btnInsert') != null){
		getId('btnInsert').onclick = function(){
			frm.action = 'insert.myba'; //url+'insert.jsp'
			frm.submit();
		}
	}
	
	if(getId('btnRegister') != null){
		getId('btnRegister').onclick = function(){
			frm.action = 'insertR.myba'; //url+'insertR.jsp'
			frm.submit();
		}
	}
	
	if(getId('btnList') !=null){
		getId('btnList').onclick = function(){
			frm.enctype='';
			frm.action = 'select.myba'; //url+'select.jsp'
			frm.submit();
		}
	}
	
	if(getId('btnFind') !=null){
		getId('btnFind').onclick = function(){
			frm.nowPage.value=1; //검색버튼이 클릭되면 nowpage로 세팅
			frm.enctype='';
			frm.action = 'select.myba'; //url+'select.jsp'
			frm.submit();
		}
	}
	
	if(getId('btnAtt') !=null){
		let btn = getId('btnAtt');
		btn.onchange = function(){
			let attList = getId('attList');
			let str = "<ul>";
			let files = btn.files; /*비티엔이 가지고 있는 파일들*/
			for(f of files){
				str +="<li>" + f.name + "( " + parseInt(f.size/1000) + " Kb)";
			}			
			str += "</ul>";
			attList.innerHTML = str;
		}
	}
	
	if(getId("btnModify") !=null){
		getId("btnModify").onclick = function(){			
				frm.action = 'modify.myba'; //frm은 뷰의 폼의 이름
				frm.submit();			
		}
		/*$('#btnModify').click(function(){
			제이쿼리 타입
		})*/		
	}
	
	if(getId("btnUpdate") !=null){
		getId("btnUpdate").onclick = function(){
			let pwd = prompt("수정하려면 암호를...");
			if(pwd != null && pwd != ''){
				frm.pwd.value = pwd;
				frm.action = 'modifyR.myba';
				frm.submit();
			}
		}				
	}
	
	
	if(getId('btnDelete') !=null){
		getId('btnDelete').onclick = function(){
			let password = prompt("삭제하려면 암호를...");
			if(password != null && password !=''){
				frm.pwd.value = password;
				frm.action="deleteR.myba";
				frm.submit();
			}
		}
	}
	
	if(getId('btnRepl')!=null){
		getId('btnRepl').onclick = function(){
			frm.action = 'repl.myba';
			frm.submit();
		}
	}
	
	if(getId('btnReplR')!=null){
		getId('btnReplR').onclick = function(){
			frm.action = 'replR.myba';
			frm.submit();
		}
	}
	
}

let go = function(nowPage){
	frm.nowPage.value = nowPage;
	frm.action = 'select.myba';
	frm.submit();
}

let view = function(serial){
	frm.serial.value = serial;
	frm.action = 'view.myba';
	frm.submit();
}


let delCheck = function(ev){//checkbox
	let tag = ev.parentElement.childNodes[2];	//label
	
	/*let test1 = ev.parentElement;
	let test2 = ev.parentElement.childNodes;
	let outputString ="";
	for(var i=0; i<test2.length; i++){
        outputString += "자식노드: " + test2[i].nodeName + "<br />";
    }
	alert(test1);
	alert(test2);
	alert(outputString);*/

	if(ev.checked){		
		tag.style.textDecoration = "line-through";
		tag.style.color='#f00';
	}else{
		tag.style.textDecoration = "none";
		tag.style.color='';
	}
}
/*let delCheck = function(ev){ //checkbox (this)가 넘어와서 ev로 받음
	let tag = ev.parentElement.childNodes[1]; //label 값 패런츠 노드 0은 div 1은 라벨, 등등 테그당 순서가 붙음(?)
	console.log(ev.name);
	if(ev.checked){
		tag.style.textDecoration="line-through";
		tag.style.color="#f00";
	}else{
		tag.style.textDecoration = "none";
		tag.style.color="";
	}
}*/