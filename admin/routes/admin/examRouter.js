var express = require('express');
var fs = require('fs');
var router = express.Router();
var sqlQuery = require('../../module/Mysql')
let multer = require('multer')
//配置上传对象
let upload = multer({dest:"./public/upload"})
//引入userListRouter路由
var taskExamRouter = require('./exam/taskExamRouter')
var taskExam2Router = require('./exam/taskExam2Router')


/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('任务审查');
});



//用户管理的路由渲染
router.use('/taskExam',taskExamRouter)
router.use('/taskExam2',taskExam2Router)


module.exports = router;
