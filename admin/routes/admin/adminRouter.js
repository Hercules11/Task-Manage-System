var express = require('express');
var router = express.Router();
var userRouter = require('./userRouter');
var equipRouter = require('./equipRouter');
var taskRouter = require('./taskRouter');
var examRouter = require('./examRouter');
var chartRouter = require('./chartRouter');
var utilRouter = require('./utilRouter')



//判断是否登录
function permission(req,res, next){
  if(req.session.username==undefined){
    //未登录，返回登录页
      res.render('info/info',{
        title:"未登录",
        content:"请重新登录，即将进入登录页",
        href:"/rl/login",
        hrefTxt:"登录页"
        
      })
  }else{
    //正常登录
    next()
  }
}
/* GET users listing. */
router.get('/', permission, function(req, res, next) {
  res.render('admin/index.ejs',{username: req.session.username})
});

//后台用户管理
router.use('/user',userRouter)

//设备管理
router.use('/equip',equipRouter)

//任务管理
router.use('/task',taskRouter)

//任务审查
router.use('/exam',examRouter)

router.use('/chart',chartRouter)

router.use('/util',utilRouter)


module.exports = router;
