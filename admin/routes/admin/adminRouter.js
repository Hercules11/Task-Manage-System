let express = require('express');
let router = express.Router();
let userRouter = require('./userRouter');
let equipRouter = require('./equipRouter');
let taskRouter = require('./taskRouter');
let examRouter = require('./examRouter');
let chartRouter = require('./chartRouter');
let utilRouter = require('./utilRouter')


//判断是否登录
function permission(req,res, next){
  if (req.session.username==undefined) {
    //未登录，返回登录页
    res.render('login/login.ejs');
  } else {
    //正常登录
    next();
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
