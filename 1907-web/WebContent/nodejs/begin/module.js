/**
 * module_so.js;
 * date : 2020.01 
 */
let os = require('os'); //import os; include 'os.h'

console.log(os.hostname());
console.log(os.type());
console.log(os.platform());
console.log(os.arch());
console.log(os.release());
console.log(os.uptime());
console.log(os.loadavg());
console.log(os.totalmem());
console.log(os.freemem());
console.table(os.cpus());
console.log(os.networkInterfaces());
		