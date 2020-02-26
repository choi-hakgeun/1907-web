/**
 * module_member.js
 * 2020.02.26
 */
var mm = {};
mm.list = [];

mm.Data= function(id, name, phone, address){
   this.id = id;
   this.name= name;
   this.phone = phone;
   this.address = address;
}

mm.input= function(Data){ //배열에 저장
   mm.list.push(Data);
   
   
}
mm.select= function(id){
   for(let i =0; i <mm.list.length ; i++){
      if(mm.list[i].id == id){
         console.log('------------------------');
         console.log('id : %s' , mm.list[i].id);
         console.log('name : %s', mm.list[i].name);
         console.log('phone : %s', mm.list[i].phone);
         console.log('address : %s', mm.list[i].address);
         console.log('------------------------');
      }
   }
}

mm.output= function(){
   console.log("회원목록---------")
   for( d of mm.list){
      console.log('%s \t %s \t %s \t %s', d.id, d.name, d.phone, d.address);
      
   }
}
module.exports = mm;