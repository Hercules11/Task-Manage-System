var express = require('express');
var fs = require('fs');
var router = express.Router();
var sqlQuery = require('../../module/Mysql')
let multer = require('multer')
//配置上传对象
let upload = multer({dest:"./public/upload"})
//引入userListRouter路由
var taskListRouter = require('./task/taskListRouter')
var taskExecRouter = require('./task/taskExecRouter')
var taskBreakRouter = require('./task/taskBreakRouter')


/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('任务管理');
});



//用户管理的路由渲染
router.use('/taskList',taskListRouter)

router.use('/taskExec',taskExecRouter)

router.use('/taskBreak',taskBreakRouter)


module.exports = router;
