var express = require('express');
var fs = require('fs');
var router = express.Router();
var sqlQuery = require('../../module/Mysql')
let multer = require('multer')
//配置上传对象
let upload = multer({dest:"./public/upload"})
//session配置
var taskRouter = require('./worker/taskRouter')
var statRouter = require('./worker/statRouter')
var feedbackRouter = require('./worker/feedbackRouter')
var historyRouter = require('./worker/historyRouter')

var task_Router = require('./inspector/task_Router')
var stat_Router = require('./inspector/stat_Router')
var feedback_Router = require('./inspector/feedback_Router')
var history_Router = require('./inspector/history_Router')


//引入路由，在路由里面还要导出
router.use('/inspector/history',history_Router)
router.use('/inspector/feedback',feedback_Router)
router.use('/inspector/stat',stat_Router)
router.use('/inspector/task',task_Router)

router.use('/worker/history',historyRouter)
router.use('/worker/feedback',feedbackRouter)
router.use('/worker/stat',statRouter)
router.use('/worker/task',taskRouter)
/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('用户信息');
});
//个人信息路由
router.get('/self_info', async (req, res)=>{
  //通过登录用户的session查找个人信息
  let username = req.session.username;
  let sqlStr = 'select * from user where username = ? ';
  let result = await sqlQuery(sqlStr, [username]);
  let user = result[0];
  let role = await getRole();
  let options = {user, role};
  // console.log(options);
  res.render('client/user/self_info',options)
})

//获取图片路由
router.post('/selfImgUpload',upload.single('img_file'), async (req,res)=>{
  let username = req.session.username;
  let result = rename(req);
  //将改名后的结果，上传到数据库
  let strSql = "update user set image_header = ? where username = ?"
  await sqlQuery(strSql,[result.imgUrl,username])
  res.json(result)
})

function rename(req){
  //console.log(req.file)
  let oldPath = req.file.destination+"/"+req.file.filename;
  let newPath = req.file.destination+"/"+req.file.filename+req.file.originalname;
  fs.rename(oldPath,newPath,()=>{
      //console.log("改名成功")
  })
  return {
    state:'ok',
    imgUrl:"/upload/"+req.file.filename+req.file.originalname
  }
}

//获取角色
async function getRole(){
  let sqlStr = 'select * from role';
  let result = await sqlQuery(sqlStr);
  return Array.from(result);
}

router.post('/self_info',async (req, res)=>{
  //更新数据
  let id = req.body.id;
  let password = req.body.password;
  let mobile = req.body.mobile;
  let email = req.body.email;
  let role_id = req.body.role_id;
  let username = req.body.username;
  let sqlStr = "update user set password=?, mobile=?, email=?, role_id=?, username=? where id=?";
  let arr = [password, mobile, email, role_id, username, id]
  await sqlQuery(sqlStr,arr);
  res.json({
    state:"ok",
    content:"更新成功"
  })
})



module.exports = router;
