/** javascript_board 에서 사용되는 script
 *  date : 2020-01-12
 */
//localStorage에 저장된 데이터
let temp;
var seq;
let db;

function loadDB(){
	let temp = localStorage.getItem('board');
	seq = localStorage.getItem('seq');
	console.log(temp);
	if(temp == null){		
		db = [];
	}else{
		//문자열 형태로 저장되어있던 값이 오브젝트 형태로 바꿈.
		//실제 배열로 바꿔줌.
		db = JSON.parse(temp);
	}
	if(seq == null){
		seq = 1;
	}
}
function storeDB(){
	let tempDB = JSON.stringify(db);
	localStorage.setItem('board', tempDB);
	localStorage.setItem('seq', seq);
}

function Data(mName, subject, content, serial, hit, mDate){
	this.mName = mName;
	this.subject = subject;
	this.content = content;
	this.serial = serial;
	this.hit = hit;
	this.mDate = mDate;	
}
Data.prototype.toJSON = function(){
	let str = {
			'serial'    : this.serial,
			'mName'     : this.mName,
			'subject'   : this.subject,
			'content'   : this.content,
			'mDate'     : this.mDate,
			'hit'       : this.hit
	};
	return str;
}

function toHTML(d){//자바스트립트 코드이기 때문에 역슬러시를 제외함.jsp 파일에서는 역슬러시
	let str = `
	  <div class='items'>
	    <span class='serial'>${d.serial}</span>
	    <span class='subject'><a href='#' onclick='view(${d.serial})'>${d.subject}</a></span>
	    <span class='mName'>${d.mName}</span>
	    <span class='mData'>${d.mDate}</span>
	    <span class='hit'>${d.hit}</span>
	  </div>`;
	return srt;	
}

function view(serial){
	
	for(let i=0; i<db.length; i++){
		if(db[i].serial ==serial){
			let data = db[i];
			data.hit++;//조회수 증가
			db[i] = data;
			storeDB();
			break;
		}
	}
	localStorage('serial',serial);	
	location.href='view.jsp';
}
if(brd.btnSelect != null){
	console.log("이프문실행?");
	brd.btnSelect.onclick = function(){
    location.href = 'select.jsp';
	}
}
if(brd.btnUpdate != null){	//내용수정
	brd.btnUpdate.onclick = function(){
		let yn = confirm('정말 수정하시겠습니까?');
		if(yn){
			let serial = brd.serial.value;			
			for(let i=0; i<db.length ;i++){
				if(db[i].serial == serial){
					let data = db[i];
					data.subject = brd.subject.value;
					data.content= brd.content.value;
					db[i] = data;
					storeDB();
					break;
				}
			}
		}
		location.href='select.jsp';
	}	
}
if(brd.btnInsert != null){
	brd.btnInsert.onclick = function(){
		location.href='insert.jsp';
	}
}

if( brd.btnSave != null){
  brd.btnSave.onclick = function(){
	loadDB();	
	let tempDate = new Date();
	let now = tempDate.getFullYear() +'-' 
	        + (tempDate.getMonth()+1) + '-'
	        +  tempDate.getDate();
	seq++;
	let data = new Data(brd.mName.value , brd.subject.value, 
			             brd.content.value, seq, 0, now);
	db.push(data);
	storeDB();	
  }
}

if(brd.btnSearch != null ){
  brd.btnSearch.onclick = function(){
	let list = document.getElementById('list');
	let findStr = brd.findStr.value;//검색 텍스트상자
	localStorage.setItem('findStr', findStr);
	loadDB();
	db.sort(mySort);
	list.innerHTML = '';
	for( d of db){
		if(d.subject.indexOf(findStr)>=0 || d.document.indexOf(findStr)>=0){
			list.innerHTML += toHTML(d);			
		}
	}
  }
}
function mySort(obj1, obj2){
	return Number(obj2.serial) - Number(obj1.serial);
}

if(brd.btnModify != null){
	brd.btnModify.onclick = function(){
		let serial = brd.serial.value;
		localStorage.setItem('serial', serial);
		location.href = 'modify.jsp'
	}
}

if(brd.btnInit != null){
	brd.btnInit.onclick = function(){
		let yn = confirm('데이터 베이스 초기화함?');
		if(yn){
			localStorage.removeItem('board');
			localStorage.removeItem('seq');
			db = [];
		}		
	}	
}
if(brd.btnDelete != null){
	brd.btnDelete.onclick = function(){
		let yn = confirm('정말 삭제??');
		if(yn){
			let serial = brd.serial.value;
			for(let i=0; i<db.length; i++){
				if(db[i].serial ==serial){
					db.splice(i)
				}
			}
		}
	}
}