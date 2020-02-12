/**
 * 
 */
let temp;
var seq;
let db;

function loadDB(){
	temp = localStorage.getItem('board');
	seq = localStorage.getItem('seq');
	console.log(temp);
	if(temp == null){
		console.log('do is null')
		db = [];
	}else{
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
function toHTML(d){
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
	localStorage('serial',serial);	
	location.href='view.jsp'
}
if(brd.btnSelect != null){
	brd.btnSelect.onclick = function(){
    location.href = ''
	}
}

if( brd.btnSave != null){
brd.btnSave.onclick = function(){
	loadDB();	
	let tempDate = new Date();
	let now = tempDate.getFullYear() +'-' +(tempDate.getMonth()+1) + '-'+tempDate.getDate();
	seq++;
	let data = new Data(brd.mName.value , brd.subject.value, brd.content.value, seq, 0, now);
	db.push(data);
	storeDB();	
}
}
/*if(brd.btnUpdate != null){	
	brd.btnUpdate.onclick = function(){
		let yn = confirm
		for()
	}
	
}*/

if(brd.btnSearch != null ){
brd.btnSearch.onclick = function(){
	let list = document.getElementById('list');
	let findStr = brd.findStr.value;
	localStorage.setItem('findStr', findStr);
	loadDB();
	list.innerHTML = '';
	for( d of db){
		if(d.subject.indexOd(findStr)>=0 || d.document.indexOf(findStr)>=0){
			list.innerHTML += toHTML(d);			
		}
	}
  }
}
if(brd.btnModify != null){
	brd.btnModify.onclick = function(){
		localStorage.setItem('serial', serial);
		location.href = 'modify.jsp'
	}
}

if(brd.btnInit != null){
	brd.btnInit.onclick = function(){
		let yn = confirm('데이터 베이스 초기화함?');
		if(yn){
			localStorage.removeItem('board', null);
			localStorage.removeItem('seq', null);
			db = [];
		}		
	}	
}