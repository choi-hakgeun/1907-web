/* data_process.js
 * date:2020.02.26
 *get,post,put,del타입의 라우터로 데이터 처리
 */

var express = require('../begin/node_modules/express');
var bodyParser = require('../begin/node_modules/body-parser');

var app = express();
app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended : false}));

let items= [
   {'name' : '우유', 'price' : 2000},
   {'name' : '홍차', 'price' : 5000},
   {'name' : '커피', 'price' : 5000}
];

app.post('/all', function(req , resp){
   let str = '<div id="title"><span class="a"> 품목</span>'
            +'<span class ="b">가격</span></div>';
   
   for(d of items){
      str += '<div><span>' + d.name + '</span><span>' + d.price + '</span></div>';
   }
   let css = "<style>#title{ background:black};</style>";
   resp.send(items)
})
//품목조회
app.get ('/search', function(req, resp){
   let find = req.param('name');
   let msg = '검색결과</br>';
   for (d of items){
      if(d.name == find){
         msg += '<li>품목 : ' + d.name
               + '<li>단가: ' +d.price;
      }
   }
   resp.send(msg);
})
// 입력
app.post('/insert', function(req, resp){
   let n = req.body.name;
   let p = req.body.price;
   let d = {'name' : n , 'price' : p };
   items.push(d);
   resp.send(n + '자료가 추가됨.')
})

app.post('/modify', function(req, resp){
   let n = req.body.name;
   let p = req.body.price;
   for(d of items){
      if(d.name == n){
         d.price = p;
      }
   }
   resp.send(n + '의 단가가 ' + p + '수정됨.');
})

app.post('/del', function(req, resp){
   let n = req.body.name;
   for(i=0 ; i<items.length; i++){
      if(items[i].name == n){
         items.splice(i, 1);
      }
   }
   resp.send('<font color="red">' + n + '자료가 삭제됨.</font>');
})

app.listen(9991,function(){
      
   console.log('http://127.0.0.1:9991');
})