/* javascript_board 에서 사용되는 script
 * date : 2020-01-12
 */

//localStorage에 저장된 데이터를 배열에 저장
let seq; // 시퀀스
let db;

function loadDB(){
	let temp = localStorage.getItem('board');
	seq = localStorage.getItem('seq');
	if(temp == null){
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
	localStorage.setItem('board',  tempDB);
	localStorage.setItem('seq', seq);
}

function Data(mName, subject, content, serial, hit, mDate ){
	this.mName = mName;
	this.subject = subject;
	this.content = content;
	this.serial = serial;
	this.hit = hit;
	this.mDate = mDate;
}

function toHTML(d){
  let str = `
			<div class='items'>
				<span class='serial'>${d.serial}</span>
				<span class='subject'><a href='#' onclick='view(${d.serial})'>${d.subject}</a></span>
				<span class='mName'>${d.mName}</span>
				<span class='mDate'>${d.mDate}</span>
				<span class='hit'>${d.hit}</span>
			</div>`;
	return str;
}

function view(serial){
	
	for(let i=0 ; i<db.length ; i++){
		if(db[i].serial == serial){
			let data = db[i];
			data.hit++;
			db[i] = data;
			storeDB();
			break;
		}
	}
	
	localStorage.setItem('serial', serial);
	location.href='view.jsp';
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
		let now = tempDate.getFullYear() + '-' 
		        + (tempDate.getMonth()+1) + '-' 
		        + tempDate.getDate();
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
		let findStr = brd.findStr.value;
		localStorage.setItem('findStr', findStr);
		loadDB();
		db.sort(mySort);
		list.innerHTML = '';
		for(d of db){
			if(d.subject.indexOf(findStr)>=0 || d.content.indexOf(findStr)>=0){
				list.innerHTML += toHTML(d);
			}
		}
	}
}
function mySort(obj1, obj2){
	return Number(obj2.serial) - Number(obj1.serial);
}

if(brd.btnModify != null){ //수정 삭제폼으로 이동
	brd.btnModify.onclick = function(){
		let serial = brd.serial.value;
		localStorage.setItem('serial', serial);
		location.href='modify.jsp';

	}
}



if(brd.btnSelect != null){
	brd.btnSelect.onclick = function(){
		location.href='select.jsp';

	}
}

if(brd.btnUpdate != null){ //내용 수정
	brd.btnUpdate.onclick = function(){
		let yn = confirm('정말 수정 할거지요 ?????');
		if(yn){
			let serial = brd.serial.value;
			for(let i=0 ; i<db.length ; i++){
				if(db[i].serial == serial){
					let data = db[i];
					data.subject = brd.subject.value;
					data.content = brd.content.value;
					db[i] = data;
					storeDB();
					break;
				}
			}
			location.href='select.jsp';
		}

	}
}

if(brd.btnDelete != null){
	brd.btnDelete.onclick = function(){
		let yn = confirm('정말 삭제할거지요 ?????');
		if(yn){
			let serial = brd.serial.value;
			for(let i=0 ; i<db.length ; i++){
				if(db[i].serial == serial){
					db.splice(i,1);
					storeDB();
					break;
				}
			}
			location.href='select.jsp';
		}
	}
}


if(brd.btnInit !=null ){
	brd.btnInit.onclick = function(){
		let yn = confirm('데이터 베이스를 정말 초기화 할거요???');
		if(yn){
			localStorage.removeItem('board');
			localStorage.removeItem('seq');
			db = [];
		}
	}
}