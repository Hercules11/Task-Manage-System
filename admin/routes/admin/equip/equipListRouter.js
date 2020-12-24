var express = require('express');
var fs = require('fs');
var router = express.Router();
var sqlQuery = require('../../../module/Mysql');
let multer = require('multer')
//配置上传对象
let upload = multer({dest:"./public/upload"})

/* GET equip listing. 获取页面，用于模板引擎渲染数据*/
router.get('/',async function(req, res, next) {
  //查找数据库的表格
  //？page 分页数据
  let page = req.query.page;
  page = page ? page : 1;
  //查找语句
  let sqlStr = "select * from equip limit ?, 5"
  let result = await sqlQuery(sqlStr,[(parseInt(page)-1)*5])
  let options ={
      equipList:Array.from(result)
  }
res.render('admin/equip/equipList.ejs',options)
});

//获取设备列表，获取数据，对接表格数据
router.get('/api/equipList',async (req, res)=>{
  let page = parseInt(req.query.page);
  let limitNum = parseInt(req.query.limit);
  let sqlStr = "select * from equip limit ? ,?";
  let sqlStr1 = "select count(id) as equipNum from equip";
  let result1 =  await sqlQuery(sqlStr1)
  let count =result1[0].equipNum
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

//添加设备
router.get('/add_equip',function(req, res, next){
  res.render('admin/equip/add_equip')
})

router.post('/add_equip',async (req, res)=>{      
  //更新数据
let plant = req.body.plant;
let work = req.body.work;
let name = req.body.name;
let model = req.body.model;
let number = req.body.number;
let state = req.body.state;
    let sqlStr = "insert into equip (plant, work, name, model, number, state) values(?,?,?,?,?,?)";
    let arr = [plant, work, name, model, number, state]
    await sqlQuery(sqlStr,arr);
    res.json({
    state:"ok",
    content:"更新成功"
  })
})

//编辑设备
router.get('/editEquip',async (req, res)=>{
  let equip_id = req.query.id;
  //通过设备id查找所有信息 
  let sqlStr = 'select * from equip where id = ? ';
let result = await sqlQuery(sqlStr, [equip_id]);
let equip = result[0];

let options = {equip};
res.render('admin/equip/edit_equip',options)
})

//更新数据
router.post('/edit_equip',async (req, res)=>{
  //更新数据 
  let id = req.body.id;
  let plant = req.body.plant;
  let work = req.body.work;
  let name = req.body.name;
  let model = req.body.model;
  let number = req.body.number;
  let state = req.body.state;
  let sqlStr = "update equip set plant=?, work=?, name=?, model=?, number=?, state=? where id=?";
  let arr = [plant,work,name,model,number,state, id]
  console.log(arr)
  await sqlQuery(sqlStr,arr);
  res.json({
    state:"ok",
    content:"更新成功"
  })
})




module.exports = router;
