var express = require('express');
var router = express.Router();
var sqlQuery = require('../../../module/Mysql');
var moment = require('moment');



/* GET users listing. */
router.get('/', async (req, res, next)=>{
  let username = req.session.username;
  // console.log(username)
  let sqlStr = 'select name from task where inspector=?';
  let name = await sqlQuery(sqlStr, [username]);
  // console.log(name)
  let options = JSON.parse(JSON.stringify(name))
// console.log(options)
  res.render('client/inspector/statistic',{options});
});

router.post('/data_view',async (req,res,next)=>{
  let task_name = req.body.task_name;
  let _date = req.body._date;

  let sqlStr0 = 'select person from task where name=?';
  let result0 = JSON.parse(JSON.stringify(await sqlQuery(sqlStr0,[task_name])));
  let legend_worker = [result0[0].person];
  console.log(legend_worker)
  //查询执行任务人
  var query_time =  moment(_date).format('YYYY-MM-DD');
let getNextDate = function (date,day) {
  var dd = new Date(date);
  dd.setDate(dd.getDate() + day);
  var y = dd.getFullYear();
  var m = dd.getMonth() + 1 < 10 ? "0" + (dd.getMonth() + 1) : dd.getMonth() + 1;
  var d = dd.getDate() < 10 ? "0" + dd.getDate() : dd.getDate();
  return y + "-" + m + "-" + d;
};
let X_axios = [];
let Y_axios = [];
//空数组要放到外面，遗忘了
  //获取计划需要的数据
  // console.log(params)
  for(var i=0;i<5;i++){
    let query_date = getNextDate(query_time,-i);
    let params = [task_name,query_date];
    let sqlStr = 'SELECT scores,_time FROM exam WHERE name=? AND _date LIKE CONCAT(?,"%")';
    let result = JSON.parse(JSON.stringify(await sqlQuery(sqlStr,params)));
    // console.log(result) //加一个if判断解决空值问题
    //null数组和空数组不一样啊null的话有个壳子，空的话，啥都没有
    //编译器显示[]有点误导人的意思
    if(result.length==0){
      let Default = { scores: '0', _time: '无数据'};//创建对象多种方式，六种中的字面模式
      result.push(Default)
      // console.log(Default) 
      X_axios.push(result[0]._time);
      // console.log(X_axios)
      Y_axios.push(result[0].scores);
      // console.log(Y_axios)

    }else if(result[0].scores==null){
      //还未评分，则数组为null
      let no_result = {scores: '0',_time: '未评分'}
      result.push(no_result)
      // console.log(no_result) 
      // console.log(result)
      X_axios.push(result[1]._time);
      // console.log(X_axios)
      Y_axios.push(result[1].scores);
      // console.log(Y_axios)
      }else{
        let _time = moment(result[0]._time).format('MM-DD'+'日');    
        X_axios.push(_time);
        // console.log(X_axios)
        Y_axios.push(result[0].scores);
        // console.log(Y_axios)
      //参数以及是数组形式了，就不要再加数组符号了
    };    
  };
  res.send({
    _time: X_axios,
    scores: Y_axios,
    person: legend_worker
  })
  //worker是构造函数来的
  //不用json用send即可，他会从哪来到哪去，我猜的，被误导用json解决不了，差点把整个async await改为哪个callback
})
module.exports = router;
