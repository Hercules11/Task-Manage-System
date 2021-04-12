var express = require('express');
var fs = require('fs');
var router = express.Router();
var sqlQuery = require('../../module/Mysql')


/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('数据报表');
});

router.get('/chart',async function(req, res, next){
    let sqlStr1 = "select count(id) as userNum from user"
    let sqlStr2 = "select count(id) as equipNum from equip"
    let sqlStr3 = "select count(id) as formNum from form"
    let sqlStr4 = "select count(id) as taskNum from task"

    let result1 = await sqlQuery(sqlStr1)
    let result2 = await sqlQuery(sqlStr2)
    let result3 = await sqlQuery(sqlStr3)
    let result4 = await sqlQuery(sqlStr4)

    let count1 =result1[0].userNum
    let count2 =result2[0].equipNum
    let count3 =result3[0].formNum
    let count4 =result4[0].taskNum

    let options ={count1,count2,count3,count4}
    // console.log(options)
    res.render('admin/chart/chart.ejs',{options})
});


module.exports = router;
