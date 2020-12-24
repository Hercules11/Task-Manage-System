var express = require('express');
var router = express.Router();
var sqlQuery = require('../../../module/Mysql')
var bodyParser = require('body-parser')
/* GET task listing. */
router.get('/', function(req, res, next) {
  res.render('admin/task/taskList.ejs');
});

//获取表格数据
router.get('/api/taskList',async (req, res)=>{
  let page = parseInt(req.query.page);
    let limitNum = parseInt(req.query.limit);
  let sqlStr = "select * from task limit ? ,?";
  let sqlStr1 = "select count(id) as taskNum from task";
  let result1 =  await sqlQuery(sqlStr1)
  let count =result1[0].taskNum
  let arr = [(page-1)*limitNum,limitNum]
  let result =await sqlQuery(sqlStr,arr)
  // console.log(result)
  let options = {
    "code": 0,
    "msg": "",
    "count": count,
    "data": Array.from(result)
  } 
res.json(options)
})

//添加任务模块
router.get('/add_taskList',async (req, res)=>{
  res.render('admin/task/add_task')
})

//添加任务列表数据
router.post('/add_taskList',async (req, res)=>{      
  //更新数据
let name = req.body.name;
let start = req.body.start;
let end = req.body.end;
let init = req.body.init;
let person = req.body.person;
  let sqlStr = "insert into task (name, start, end, init, person) values (?,?,?,?,?)";
  //sql语句里面的中文逗号看不出阿，不能用关键字
  let arr = [name, start, end, init, person];
  await sqlQuery(sqlStr,arr);
  res.json({
  state:"ok",
  content:"更新成功"
    })
})
//编辑任务内容
router.get('/editTask',async (req, res)=>{
  let id = req.query.id;
  let sqlStr = 'select * from task where id=?';
  let result = await sqlQuery(sqlStr,id)
  // console.log(result)
  let editTask = JSON.parse(JSON.stringify(result[0]));
  // console.log(editTask)
  res.render('admin/task/editTask',{editTask})
});
router.post('/editTask',async (req, res)=>{      
  //更新数据
  let id = req.body.id;
let name = req.body.name;
let start = req.body.start;
let end = req.body.end;
let init = req.body.init;
let person = req.body.person;
let inspector = req.body.inspector;
  let sqlStr = "update task set name=?,start=?,end=?,init=?,person=?,inspector=? where id=?";
  //sql语句里面的中文逗号看不出阿，不能用关键字
  let arr = [name, start, end, init, person,inspector,id];
  await sqlQuery(sqlStr,arr);
  res.json({
  state:"ok",
  content:"更新成功"
    })
})

//接收传过来的数据
router.post('/addTaskItem',async (req, res)=>{      
  //更新数据
  //数据是传过来了，但是没收到
  //用json.stringify序列化数据即可
  let id = req.query.id;
  // console.log(id)
let array = JSON.parse(req.body.data);
// console.log(array[0])
let sqlStr = 'insert into task_item (name, item_id) values (?,?)';
for(var i=0; i<array.length;i++){
  let params = [id, array[i]];
  let sqlStr1 = 'select name, item_id from task_item where name=? and item_id=?';
  let result1 = await sqlQuery(sqlStr1,params);
  if(result1.length==0){
    await sqlQuery(sqlStr, params)
  }  
};
res.json({
  state:"ok",
  content:"更新成功"
    })
})
//删除以添加的子项目
router.get('/delItem',async (req,res)=>{
  let item_id = req.query.item_id;
  let sqlStr = "delete from task_item where item_id = ?"
  let result = await sqlQuery(sqlStr,[item_id]);
  // console.log(result);
  res.json({
    state:"ok",
    content:Array.from(result)
  })
})

//获取子项目列表，获取数据，对接表格数据
router.get('/api/itemList',async (req, res)=>{
  let page = parseInt(req.query.page);
  let limitNum = parseInt(req.query.limit);
  let sqlStr = "select form_item.id,name,location,standard,state,method,period,form_item.person from form_item inner join form on form_item.base_id=form.id  limit ?,?";
  let sqlStr1 = "select count(id) as itemNum from form_item";
  let result1 =  await sqlQuery(sqlStr1)
  let count =result1[0].itemNum
  let arr = [(page-1)*limitNum,limitNum]
  //替换基准书名字
  
  let result = await sqlQuery(sqlStr,arr)
  // console.log(result)
  let options = {
      "code": 0,
      "msg": "",
      "count": count,
      "data": Array.from(result)
    } 
  res.json(options)
})
//获取已经选择的子项目
router.get('/api/selectedItemList',async (req,res)=>{
  let id = req.query.id;
  let page = parseInt(req.query.page);
  let limitNum = parseInt(req.query.limit);
  let sqlStr = "select item_id,form.name,location,standard,state,method,period,form_item.person from ((task_item inner join form_item on task_item.item_id=form_item.id) inner join form on base_id=form.id) where task_item.name=? limit ?,?";

  let sqlStr1 = "select count(item_id) as itemNum from (select item_id,form.name,location,standard,state,method,period,form_item.person from ((task_item inner join form_item on task_item.item_id=form_item.id) inner join form on base_id=form.id) where task_item.name=?) as NumTable";
  let result1 =  await sqlQuery(sqlStr1,id)
  let count =result1[0].itemNum

  let arr = [id,(page-1)*limitNum,limitNum]
  //替换基准书名字  
  let result = await sqlQuery(sqlStr,arr)
  let format = JSON.parse(JSON.stringify(result))
  // console.log(format)
  let option = {
      "code": 0,
      "msg": "",
      "count": count,
      "data": Array.from(format)
    } 
  res.json(option)

})

module.exports = router;
