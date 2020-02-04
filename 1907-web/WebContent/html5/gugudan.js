/**
 * worker에서 사용되는 구구단
 */

let dan=5;
let str='';
for(i=1; i<5000; i++){
	str += dan +"*"+i+"="+(dan*i)+"\n";
	
	for(j=0; j<10000; j++){}//delay가 필요해서
}

postMessage(str);