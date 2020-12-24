var express = require('express');
var fs = require('fs');
var router = express.Router();
var sqlQuery = require('../../module/Mysql')
let multer = require('multer')
//配置上传对象
let upload = multer({dest:"./public/upload"})
//引入userListRouter路由
var equipListRouter = require('./equip/equipListRouter')
var formListRouter = require('./equip/formListRouter')

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('设备管理');
});



//用户管理的路由渲染
router.use('/equipList',equipListRouter)

router.use('/formList',formListRouter)

module.exports = router;
