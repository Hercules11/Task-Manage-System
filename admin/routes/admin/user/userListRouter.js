var express = require('express');
var fs = require('fs');
var router = express.Router();
var sqlQuery = require('../../../module/Mysql');
let multer = require('multer')
//配置上传对象
let upload = multer({dest:"./public/upload"})

/* GET users listing. */
router.get('/',async function(req, res, next) {
    //查找数据库的表格
    //？page 分页数据
    let page = req.query.page;
    page = page ? page : 1;
    //查找语句
    let sqlStr = "select * from user limit ?, 5"
    let result = await sqlQuery(sqlStr,[(parseInt(page)-1)*5])
    let options ={
        userList:Array.from(result)
    }
  res.render('admin/user/userList.ejs',options)
});

router.post('/del_user',async (req,res)=>{
    let del_list = req.body['del_list[]']
    del_list.forEach( async (item,i)=>{
        let sqlStr = "delete from user where id = ?";
        await sqlQuery(sqlStr,item);
    })
    console.log(del_list)
    res.json({
        state:"ok",
        content:"删除成功"
    })
})

//获取用户列表
router.get('/api/userList',async (req, res)=>{
    let page = parseInt(req.query.page);
    let limitNum = parseInt(req.query.limit);
    let sqlStr = "select `user`.id,`user`.username,`user`.mobile,`user`.email,role.role_name,`user`.image_header "+
   " from user LEFT JOIN role " +
    "on `user`.role_id=role.id limit ? ,?";
    let sqlStr1 = "select count(id) as userNum from user";
    let result1 =  await sqlQuery(sqlStr1)
    let count =result1[0].userNum
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

//编辑员工信息
router.get('/editUser',async (req, res)=>{
    let user_id = req.query.id;
    //通过用户名查找所有信息
    let sqlStr = 'select * from user where id = ? ';
  let result = await sqlQuery(sqlStr, [user_id]);
  let user = result[0];
  let role = await getRole()

  let options = {user, role};
  res.render('admin/user/user_info',options)
})

//获取图片路由
router.post('/selfImgUpload',upload.single('img_file'), async (req,res)=>{
    let username = req.query.username;
    let result = rename(req);
    //将改名后的结果，上传到数据库
    let strSql = "update user set image_header = ? where username = ?"
    await sqlQuery(strSql,[result.imgUrl,username])
    res.json(result)
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
  
  //获取角色
  async function getRole(){
    let sqlStr = 'select * from role';
    let result = await sqlQuery(sqlStr);
    // console.log(result);
    return Array.from(result);
  }
//添加用户模块
  router.get('/add_user',async (req, res)=>{
      let role = await getRole()
      let options = {role};
      console.log(options);
      res.render('admin/user/add_user',options)
  })

  router.post('/add_user',async (req, res)=>{      
      //更新数据
    let username = req.body.username;
    let password = req.body.password;
    let mobile = req.body.mobile;
    let email = req.body.email;
    let role_id = req.body.role_id;
    let image_header = req.body.image_header;
    //判断用户名是否存在
    let sqlStr1 = "select * from user where username =?"
    let result1 = await sqlQuery(sqlStr1,[username])
    if(result1.length == 0){
        let sqlStr = "insert into user (username, password, mobile, email, role_id, image_header) values(?,?,?,?,?,?)";
        let arr = [username,password,mobile,email,role_id,image_header]
        await sqlQuery(sqlStr,arr);
        res.json({
        state:"ok",
        content:"更新成功"
  })
    }else{
        res.json({
        state:"fail",
        content:"此用户名已存在"
          })
    }
    
})

router.get('/delUser',async (req,res)=>{
  let user_id = req.query.user_id;
  let sqlStr = "delete from user where id = ?"
  let result = await sqlQuery(sqlStr,[user_id]);
  console.log(result);
  res.json({
    state:"ok",
    content:Array.from(result)
  })
})

module.exports = router;
