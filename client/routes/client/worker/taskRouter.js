var express = require('express');
var router = express.Router();
var sqlQuery = require('../../../module/Mysql')
let multer = require('multer')
let upload = multer({dest:"./public/upload"})
var fs = require('fs');
var moment = require('moment');

/* GET task listing.  */
router.get('/', async function(req, res, next) {
  let username = req.session.username;
  // console.log(username)
  var current_time =  moment(Date.now()).format('YYYY-MM-DD');
  let sqlStr = 'select * from exec where person=? and _date like CONCAT(?,"%")';
  //单引号里面是双引号，md想骂人，骂不出口
  // console.log(current_time)
  let result = await sqlQuery(sqlStr,[username,current_time]);
  let options = JSON.parse(JSON.stringify(result))  
// console.log(options)
  res.render('client/worker/taskList',{options});
});

//获取清单详情
router.get('/itemList',async function(req, res, next){
  let name = req.query.name;
  //好像是这里会自动解码
  let params = encodeURIComponent(name);
  //你尽管为了传递参数，编码，体会自动进行解码
  // console.log(params)
  var current_time =  moment(Date.now()).format('YYYY-MM-DD');

  let sqlStr = 'select task.name,location,standard,state,method,period from (task INNER JOIN exec_item on task.id=exec_item.exec_id) INNER JOIN form_item on exec_item.item_id=form_item.id where task.name=? and _date like CONCAT(?,"%")'
  let result = await sqlQuery(sqlStr, [name, current_time])
  let options = JSON.parse(JSON.stringify(result))
// console.log(options)
res.render('client/worker/itemList',{params,options})
})

//隐患等级模块
router.get('/enroll',function(req,res,next){
let name = decodeURIComponent(req.query.name);
console.log(name)

  res.render('client/worker/enroll.ejs',{name})
})

router.post('/enroll',async (req, res)=>{      
  //更新数据
let name = req.body.name;
let location = req.body.location;
let urgency = req.body.urgency;
let person = req.body.person;
let _date = req.body._date;
let description = req.body.description;
let picture = req.body.picture;
    let sqlStr = "insert into break (name, location,urgency, person, _date, description, picture) values(?,?,?,?,?,?,?)";
    let arr = [name, location,urgency, person, _date, description, picture]
    await sqlQuery(sqlStr,arr)
    res.json({
    state:"ok",
    content:"更新成功"
      })
})
 //添加用户的上传
 router.post('/addImgUpload',upload.single('img_file'), async (req,res)=>{
  let username = req.query.username;
  let result = rename(req);
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

//注销工单模块
router.get('/destroy',function(req,res,next){
  let name = req.query.name;
  //同一个值，传两个不同的参数进去
  let params = encodeURIComponent(name)
  var current_time =  moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');

  res.render('client/worker/destroy.ejs',{name,params,current_time})
})

router.post('/destroy',async (req, res)=>{      
  //更新数据
let reason = req.body.reason;
let task = req.body.task;
let state = req.body.state;
let _time = req.body._time;
let date_params = moment(_time).format('YYYY-MM-DD');
    let sqlStr = "update exec set _time=?,state=?,reason=? where task=? and _date like CONCAT(?,'%')";
    //急切主义单引号，双引号的问题
    let arr = [_time,state,reason,task,date_params]
    await sqlQuery(sqlStr,arr)
    res.json({
    state:"ok",
    content:"更新成功"
      })
})

//一键提交模块
router.get('/finish',function(req,res){
  let name = req.query.name;
  //同一个值，传两个不同的参数进去
  let params = encodeURIComponent(name)
  var current_time =  moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');

  res.render('client/worker/finish.ejs',{name, params, current_time})
})
//虽然于注销不同，但是完成的功能是一样的
router.post('/finish',async (req, res)=>{      
  //更新数据
let task = req.body.task;
let state = req.body.state;
let _time = req.body._time;
let date_params = moment(_time).format('YYYY-MM-DD');
    let sqlStr = "update exec set _time=?,state=? where task=? and _date like CONCAT(?,'%')";
    //急切主义单引号，双引号的问题
    let arr = [_time,state,task,date_params]
    await sqlQuery(sqlStr,arr)
    res.json({
    state:"ok",
    content:"更新成功"
      })
})




module.exports = router;
