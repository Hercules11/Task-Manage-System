var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
//引入session模块
let session = require('express-session');
//引入上传模块
let multer = require('multer')
//配置上传对象
let upload = multer({dest:"./public/upload"})
let sqlQuery = require('./module/Mysql')
var moment = require('moment')



var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
//引入后台路由模块
var clientRouter = require('./routes/client/clientRouter')
//引入注册登陆模块
var loginRouter = require('./routes/login/loginRouter')

var app = express();

app.locals.moment = moment;
//设置默认端口
// app.listen(8000);
// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

//配置session
app.use(session({
  secret: "xzsagjasoigjasoi",
  resave:true,//强制保存session
  cookie:{
    // maxAge:7*24*60*60*1000,//设置session的有效期为1周
  },
  saveUninitialized:true//是否保存初始化的session
}))
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

//前台路由
app.use('/', indexRouter);
//后台路由
app.use('/client',clientRouter);
app.use('/users', usersRouter);
//登陆注册路由
app.use('/login',loginRouter);

//查询用户名是否存在
app.post('/api/exists/username',async(req,res)=>{
  console.log(req.body)
  res.append('Access-Control-Allow-Origin',"*")
  res.append('Access-Control-Allow-Content-Type',"*")
  let username = req.body.username
  let sqlStr = "select * from user where username =?"
  let result = await sqlQuery(sqlStr,[username]);
  if(result.length ==0){
    res.json({
      state:"ok",
      content:"没有此用户名，可以直接使用"
    })
  }else{
    res.json({
      state:"fail",
      content:"此用户名已被使用，请重新设置。"
    })
  }
})

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
