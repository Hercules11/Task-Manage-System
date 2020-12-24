var express = require('express');
var router = express.Router();
var sqlQuery = require('../../../module/Mysql');

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.render('admin/user/roleList');
});

router.get('/api/roleList',async (req, res)=>{
  let sqlStr = "select * from role";
  let result =await sqlQuery(sqlStr)
  let options = {
    "code": 0,
    "msg": "",
    // "count": count,
    "data": Array.from(result)
  } 
res.json(options)
})

router.get('/add_role',function(req,res,next){
  res.render('admin/user/addRole')
})

router.post('/add_role',async(req,res)=>{
  let role_name = req.body.role_name;
  let first = req.body.first;
  let second = req.body.second;
  let third = req.body.third;
  let fourth = req.body.fourth;
  let params = [role_name,first,second,third,fourth];
  // console.log(params);
  let sqlStr = 'insert into role(role_name,first,second,third,fourth) values(?,?,?,?,?)';
  await sqlQuery(sqlStr,params);
  res.json({
    state:"ok",
    content:"更新成功"
})

})

module.exports = router;
