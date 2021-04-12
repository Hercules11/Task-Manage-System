var express = require('express');
var router = express.Router();
var sqlQuery = require('../../module/Mysql')

var userRouter = require('./userRouter')
var roleRouter = require('./roleRouter')

//判断是否登录
function permission(req,res, next){
  if(req.session.username==undefined){
    //未登录，返回登录页
    res.send("用户名或密码错误");
  }else{
    //正常登录
    next()
  }
}
/* GET users listing. */
router.get('/', permission, async function(req, res, next) {
  //根据用户名判断角色信息
  let username = req.session.username;
  let sqlStr = 'select * from role where id= (select role_id from user where username = ?)' ;
  let result = await sqlQuery(sqlStr,[username])
  let options1 = JSON.stringify(result)
  let options = JSON.parse(options1)
// console.log(options)
// console.log(options[0])
  res.render('client/index.ejs',{username: req.session.username, options})
});

router.use('/user',userRouter)
router.use('/role',roleRouter)


module.exports = router;
