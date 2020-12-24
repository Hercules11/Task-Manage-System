var express = require('express');
var router = express.Router();
var sqlQuery = require('../../../module/Mysql');


/* GET users listing. */
router.get('/', function(req, res, next) {
  res.render('admin/task/breakList.ejs');
});

//获取表格数据 
router.get('/api/breakList',async (req, res)=>{
  let page = parseInt(req.query.page);
    let limitNum = parseInt(req.query.limit);
  let sqlStr = "select * from break limit ? ,?";
  let sqlStr1 = "select count(id) as breakNum from break";
  let result1 =  await sqlQuery(sqlStr1)
  let count =result1[0].breakNum
  let arr = [(page-1)*limitNum,limitNum]

  console.log(count)
  let result =await sqlQuery(sqlStr,arr)
  let options = {
    "code": 0,
    "msg": "",
    "count": count,
    "data": Array.from(result)
  } 
res.json(options)
})

//处理故障信息，指派维修技术员
router.get('/handle', async (req, res)=>{
  let id = req.query.id;
  let sqlStr = 'select * from break where id=?';
  let result = await sqlQuery(sqlStr,id);
  let options = JSON.parse(JSON.stringify(result[0]))
  // console.log(options)
  res.render('admin/task/handle',{options})

})
//接收技术员信息
router.post('/handle',async(req, res)=>{
  let id = req.query.id;
  let person = req.body.tech;
  // console.log(person)
  let sqlStr = 'update break set tech=? where id=?';
  await sqlQuery(sqlStr,[person, id])
  res.json(id)
})

module.exports = router;
