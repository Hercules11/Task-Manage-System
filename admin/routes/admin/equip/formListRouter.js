var express = require('express');
var fs = require('fs');
var router = express.Router();
var sqlQuery = require('../../../module/Mysql');
let multer = require('multer')
//配置上传对象
let upload = multer({dest:"./public/upload"})

/* GET form listing. 获取页面用于模板引擎渲染数据*/
router.get('/',async function(req, res, next) {
  //查找数据库的表格
  //？page 分页数据
  let page = req.query.page;
  page = page ? page : 1;
  //查找语句form
  let sqlStr = "select * from form limit ?, 5"
  let result = await sqlQuery(sqlStr,[(parseInt(page)-1)*5])
  let options ={
      formList:Array.from(result)
  }
res.render('admin/equip/formList.ejs',options)
});

//获取表单列表，获取数据，用于数据表格
router.get('/api/formList',async (req, res)=>{
  let page = parseInt(req.query.page);
  let limitNum = parseInt(req.query.limit);
  let sqlStr = "select * from form limit ? ,?";
  let sqlStr1 = "select count(id) as formNum from form";
  let result1 =  await sqlQuery(sqlStr1)
  let count =result1[0].formNum
  let arr = [(page-1)*limitNum,limitNum]
  let result = await sqlQuery(sqlStr,arr)
  let options = {
      "code": 0,
      "msg": "",
      "count": count,
      "data": Array.from(result)
    } 
  res.json(options)
})

//添加清单模块
router.get('/add_form',async (req, res)=>{
  res.render('admin/equip/add_form')
})

router.post('/add_form',async (req, res)=>{      
  //更新数据
let name = req.body.name;
let model = req.body.model;
let person = req.body.person;
let _date = req.body._date;
//判断用户名是否存在
  let sqlStr = "insert into form (name, model, person, _date) values(?,?,?,?)";
  let arr = [name, model, person, _date]
  await sqlQuery(sqlStr,arr);
  res.json({
  state:"ok",
  content:"更新成功"
    })
})

//编辑清单信息
router.get('/edit_form',async (req, res)=>{
  let item_id = req.query.id;
  //通过用户名查找所有信息
  let sqlStr = 'select * from form where id = ? ';
  let result = await sqlQuery(sqlStr, [item_id]);
  let sub_item = result[0];
  let options = {sub_item};
  // console.log(options)
  res.render('admin/equip/form_item',options)
})

//编辑表单信息
router.post('/edit_form',async (req, res)=>{
  //更新数据
  let id = req.body.id;
  let name = req.body.name;
  let model = req.body.model;
  let person = req.body.person;
  let date = req.body._date;
  let sqlStr = "update form set name=?, model=?, person=?, _date=? where id=?";
  let arr = [name, model, person, date, id]
  // console.log(arr)
  await sqlQuery(sqlStr,arr);
  res.json({
    state:"ok",
    content:"更新成功"
  })
})


//获取子项目列表，获取数据，对接表格数据
router.get('/api/itemList',async (req, res)=>{
  let id = req.query.id;
  let page = parseInt(req.query.page);
  let limitNum = parseInt(req.query.limit);


  let sqlStr1 = "select count(id) as itemNum from form_item where base_id=?";
  let result1 =  await sqlQuery(sqlStr1,id)
  // console.log(result1)
  let count =result1[0].itemNum
  
  let sqlStr = "(select * from form_item where base_id=?) limit ? ,?";
  let arr = [id,(page-1)*limitNum,limitNum]
  // console.log(arr)
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

//添加清单模块
router.get('/addSubItem', (req, res)=>{
  let base_id = req.query.base_id;
  // console.log(base_id)
  res.render('admin/equip/addSubItem',{base_id})
})

router.post('/addSubItem',async (req, res)=>{      
  //更新数据
let base_id = req.body.base_id;
let location = req.body.location;
let standard = req.body.standard;
let state = req.body.state;
let method = req.body.method;
let period = req.body.period;
let person = req.body.person;

//判断用户名是否存在
  let sqlStr = "insert into form_item (base_id,location, standard, state, method, period, person) values(?,?,?,?,?,?,?)";
  let arr = [base_id,location, standard, state, method, period, person]
  await sqlQuery(sqlStr,arr);
  res.json({
  state:"ok",
  content:"更新成功"
    })
})

//编辑子项目信息
router.get('/edit_item',async (req, res)=>{
  let item_id = req.query.id;
  //通过用户名查找所有信息
  let sqlStr = 'select * from form_item where id = ? ';
  let result = await sqlQuery(sqlStr, [item_id]);
  let sub_item = result[0];
  let subItem = JSON.parse(JSON.stringify(sub_item));
  // console.log(subItem)
  res.render('admin/equip/edit_item',{subItem})
})

// 编辑子项目信息
router.post('/edit_item',async (req, res)=>{
  //更新数据
  let id = req.body.id;
  let location = req.body.location;
  let standard = req.body.standard;
  let state = req.body.state;
  let method = req.body.method;
  let period = req.body.period;
  let person = req.body.person;
  let sqlStr = "update form_item set location=?,standard=?,state=?,method=?,period=?,person=? where id=?";
  let arr = [location,standard,state,method,period,person,id]
  console.log(arr)
  await sqlQuery(sqlStr,arr);
  res.json({
    state:"ok",
    content:"更新成功"
  })
})

module.exports = router;
