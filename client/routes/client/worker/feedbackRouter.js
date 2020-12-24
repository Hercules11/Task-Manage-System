var express = require('express');
var router = express.Router();
var sqlQuery = require('../../../module/Mysql');
var moment = require('moment');



/* GET users listing. */
router.get('/', async (req, res, next)=>{
  let username = req.session.username;
  // console.log(username)
  let sqlStr = 'SELECT name,_date,location,description,urgency,tech from break where person=? ORDER BY _date DESC';
  let params = await sqlQuery(sqlStr, [username]);
  // console.log(name)
  let options = JSON.parse(JSON.stringify(params))
// console.log(options)
  res.render('client/worker/feedback',{options});
});

module.exports = router;
