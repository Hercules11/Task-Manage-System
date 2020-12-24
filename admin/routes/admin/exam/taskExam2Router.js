var express = require('express');
var router = express.Router();
var sqlQuery = require('../../../module/Mysql');


/* GET users listing. */
router.get('/', function(req, res, next) {
  // res.render('admin/exam/taskExam2.ejs');
  res.send('对技术员工作任务的审查模块')
});

//获取表格数据
router.get('/api/taskExam2',async (req, res)=>{
  let page = parseInt(req.query.page);
    let limitNum = parseInt(req.query.limit);
  let sqlStr = "select * from exam limit ?, ?";
  let sqlStr1 = "select count(id) as examNum from exam";
  let result1 =  await sqlQuery(sqlStr1)
  let count =result1[0].taskNum
  let arr = [(page-1)*limitNum,limitNum]

  let result =await sqlQuery(sqlStr,arr)
  let options = {
    "code": 0,
    "msg": "",
    "count": count,
    "data": Array.from(result)
  } 
res.json(options)
})

module.exports = router;
