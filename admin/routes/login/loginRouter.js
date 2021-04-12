var express = require('express');
var router = express.Router();
var crypto = require('crypto');
var sqlQuery = require('../../module/Mysql');

function encode(str){
    let salt = "fjdsoigijasoigjasdiodgjasdiogjoasid";
    let obj = crypto.createHash('md5');
    str = salt + str;;
    obj.update(str);
    return obj.digest('hex');
}
/* GET users listing. */
router.get('/', function(req, res, next) {
  res.render('login/login.ejs');
});

//处理登陆提交的post请求
router.post('/',async (req,res)=>{
    //获取username和密码
    let username = req.body.username;
    let password = req.body.password;
    let sqlStr = "select * from user where username=? and password = ? and role_id='1'";
    let result = await sqlQuery(sqlStr, [username, password]);
    if(result.length==0){
        //登陆失败
        res.send("用户名或密码错误!");
    }else{
        req.session.username = username;
        res.render("admin/index.ejs", {username: req.session.username});
    }
})

//退出登陆
router.get('/loginout',(req,res)=>{
    req.session.destroy();
    res.render('login/login.ejs');
})

module.exports = router;
