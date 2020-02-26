/**
 * member.js
 * 2020.02.26
 */

let mm = require('./module_member.js');

let d1 = new mm.Data('kim', '김씨', '010-1111-1111', '서울 강남');
let d2 = new mm.Data('lee', '이씨', '010-1111-2222', '제주시');
let d3 = new mm.Data('park', '박씨', '010-1111-3333', '강원도');
let d4 = new mm.Data('hong', '홍씨', '010-1111-4444', '부산');

mm.input(d1);
mm.input(d2);
mm.input(d3);
mm.input(d4);

mm.select('park');
mm.output();