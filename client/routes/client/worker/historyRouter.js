var express = require('express');
var router = express.Router();
var sqlQuery = require('../../../module/Mysql');
var moment = require('moment');


/* GET users listing. */
router.get('/', async (req, res, next)=>{
  let username = req.session.username;
  // console.log(username)
  let sqlStr = 'SELECT task,state,_date,_time,reason from exec where person=? AND _time IS NOT NULL ORDER BY _time DESC';
  let params = await sqlQuery(sqlStr, [username]);
  // console.log(name)
  let options = JSON.parse(JSON.stringify(params))
// console.log(options)
  res.render('client/worker/history',{options});
});

module.exports = router;
