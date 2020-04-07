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
	
	
}
let go = function(nowPage){
	frm.nowPage.value = nowPage;
}
let view = function(serial){
	frm.serial.value = serial;
}