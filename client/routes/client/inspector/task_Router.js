var express = require('express');
var router = express.Router();
var sqlQuery = require('../../../module/Mysql')
let multer = require('multer')
let upload = multer({dest:"./public/upload"})
var fs = require('fs');
var moment = require('moment');


/* GET users listing. */
router.get('/', async function(req, res, next) {
    let username = req.session.username;
    var current_time =  moment(Date.now()).format('YYYY-MM-DD');

    let sqlStr = 'select * from exam where inspector=? and _date like CONCAT(?,"%")'
    let result = await sqlQuery(sqlStr,[username,current_time])
    let options = JSON.parse(JSON.stringify(result))    
  // console.log(options)
    res.render('client/inspector/task_List',{options});
  });

  //获取清单 详情 
router.get('/itemList',async function(req, res, next){
//  let username = req.session.username;
//居然一直可以用session，我一开始居然不知道
//  console.log(username)
    let name = req.query.name;
    let params = encodeURIComponent(name);
    // console.log(name)
    var current_time =  moment(Date.now()).format('YYYY-MM-DD');
    let sqlStr = 'select name,location,standard,state,method,form_item.id from (task INNER JOIN exec_item on task.id=exec_id) INNER JOIN form_item on item_id=form_item.id WHERE task.name=? AND _date like CONCAT(?,"%")';
    let result = await sqlQuery(sqlStr, [name,current_time])
    let options = JSON.parse(JSON.stringify(result))
  // console.log(options)
  res.render('client/inspector/item_List',{name,options,params})
  })
  
  //隐患等级模块
router.get('/enroll',function(req,res,next){
  let name = decodeURIComponent(req.query.name);
  // console.log(name)  
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

  res.render('client/inspector/destroy.ejs',{name,params,current_time})
})

router.post('/destroy',async (req, res)=>{      
  //更新数据
let reason = req.body.reason;
let name = req.body.task;
let state = req.body.state;
let _time = req.body._time;
let date_params = moment(_time).format('YYYY-MM-DD');
    let sqlStr = "update exam set _time=?,state=?,notation=? where name=? and _date like CONCAT(?,'%')";
    //急切主义单引号，双引号的问题
    let arr = [_time,state,reason,name,date_params]
    await sqlQuery(sqlStr,arr)
    res.json({
    state:"ok",
    content:"更新成功"
      })
})

//一键提交模块
router.get('/finish',async (req,res)=>{
  let name = req.query.name;
  //同一个值，传两个不同的参数进去
  let params = encodeURIComponent(name)
  var current_time =  moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
  var scores_time =  moment(Date.now()).format('YYYY-MM-DD');
  let sqlStr = 'select scores from exam where name=? and _date like CONCAT(?,"%")';
  let scores = JSON.parse(JSON.stringify(await sqlQuery(sqlStr,[name,scores_time])));
  // console.log(scores)
  let result_scores = scores[0].scores;
  res.render('client/inspector/finish.ejs',{name, params, current_time,result_scores})
})
//虽然于注销不同，但是完成的功能是一样的
router.post('/finish',async (req, res)=>{      
  //更新数据
let task = req.body.task;
let state = req.body.state;
let notation = req.body.notation;
let _time = req.body._time;
let date_params = moment(_time).format('YYYY-MM-DD');

    let sqlStr = "update exam set _time=?,state=?,notation=? where name=? and _date like CONCAT(?,'%')";
    //急切主义单引号，双引号的问题
    let arr = [_time,state,notation,task,date_params]
    await sqlQuery(sqlStr,arr)
    res.json({
    state:"ok",
    content:"更新成功"
      })
})

//提交分数模块
router.post('/scores',async(req, res, next)=>{
  //Cannot convert object to primitive value直接赋值报错
  let result = JSON.parse(JSON.stringify(req.body));
  let name =  req.query.name;
  let sqlStr0 = 'select id from task where name=?';
  let result0 = JSON.parse(JSON.stringify(await sqlQuery(sqlStr0,name)));
  let exec_id = result0[0].id;
  //数组取值，要有索引值，对象取值，要keys值
  // console.log(name)
  // console.log(result);
  let item_id = Object.keys(result);
  let scores = Object.values(result);
  var current_time =  moment(Date.now()).format('YYYY-MM-DD');
  let finish_time = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss')
   //写入exam表的信息
   let avg = function(array){
     let len = array.length;
     let sum = 0;
     for(var i=0;i<len;i++){
        sum += parseInt(array[i]);
     }
     return sum/len;
   };
  //  console.log(avg(scores).toFixed(2))
  let average = avg(scores).toFixed(2);
  let sqlStr1 = 'update exam set scores=? where name=? and _date LIKE CONCAT(?,"%")';
  let params1 = [average, name, current_time]
  await sqlQuery(sqlStr1,params1)
  // console.log(item_id)
  // console.log(scores)
  for(var i=0;i<item_id.length;i++){
    //把检查的时间和分数填进，根据它的exec_id,item_id和_date
    let sqlStr = 'UPDATE exec_item SET scores=?,_time=? WHERE exec_id=? AND item_id=? AND _date LIKE CONCAT(?,"%")';
    let Array = [scores[i],finish_time,exec_id,item_id[i],current_time];
    // console.log(Array)
    await sqlQuery(sqlStr,Array)    
      //写在for循环里面的res，一直发送信息
  };

  res.json({
    state:"ok",
    content:"更新成功"
      })


})
module.exports = router;
