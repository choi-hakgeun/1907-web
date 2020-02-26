/**
 * Score.js
 */
let array = [];
let Data = function(name, kor, eng){ //Vo
	this.name = name;
	this.kor = kor;
	this.eng = eng;
	this.tot = this.kor + this.eng;
	this.avg = this.tot/2;
}

let input = function(data){ //function(Data data)
	let temp = JSON.stringify(data); //'JSON데이터 형'을 가지고 있는 문자열로 바꿔줌.
	array.push(temp);
}

let output = function(){
	for(d of array){
		let temp = JSON.parse(d);
		console.log('name : %s', temp.name);
		console.log('kor : %d', temp.kor);
		console.log('eng : %d', temp.eng);
		console.log('tot : %d', temp.tot);
		console.log('avg : %d', temp.avg);
		console.log('---------------------');
	}
}

let main = function(argv){ //public static void main(String[] args)
	let d1 = new Data('hong', 90, 60);
	let d2 = new Data('park', 60, 66);
	let d3 = new Data('kim', 50, 55);
	
	input(d1); input(d2); input(d3);
	output();	
}
