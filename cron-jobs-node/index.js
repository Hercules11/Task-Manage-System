//index.js
const cron = require('node-cron')
const express = require('express')
const fs = require('fs')

let sqlQuery = require('./module/Mysql')


app = express();

//每天九点执行，如果不能传入参数，就在这里写死
cron.schedule('0 0 9 * * *',  async(req, res)=>{
    // console.log("running a task every second");
    //第一步 生成每日任务
    let sqlStr = 'SELECT task.id from task';
    let result = await sqlQuery(sqlStr);
    let option = JSON.parse(JSON.stringify(result));
    console.log(option)
    // for(var i=0;i<option.length;i++){
        //把内容插入到任务执行表
        let sqlStr1 = 'INSERT into exec_item(exec_id,item_id) SELECT `name`,item_id from task_item INNER JOIN form_item on task_item.item_id=form_item.id where period NOT REGEXP "年|月|周"';
        await sqlQuery(sqlStr1);
        //数据内容很少，是因为一班次的项目少
        let sqlStr2 = 'INSERT INTO exec(task,person) SELECT task.name,task.person from task';
        await sqlQuery(sqlStr2);
        //还要生成exec表的内容
        //设置数据库字段，自动获取当前时间
        //生成检查表的内容项目
        let sqlStr3 = 'insert into exam(name,person,inspector) select task.name,task.person,task.inspector from task ';
        await sqlQuery(sqlStr3);
    // }
})
//第二步，生成每周工作
cron.schedule('0 0 9 * * 2', async(req, res)=>{
     //第一步 生成每周任务
     let sqlStr = 'SELECT task.id from task';
     let result = await sqlQuery(sqlStr);
     let option = JSON.parse(JSON.stringify(result));
     console.log(option)
    //  for(var i=0;i<option.length;i++){
         let sqlStr1 = 'INSERT into exec_item(exec_id,item_id) SELECT `name`,item_id from task_item INNER JOIN form_item on task_item.item_id=form_item.id where period REGEXP "周"';
         await sqlQuery(sqlStr1);
         //设置数据库字段，自动获取当前时间
    //  }
})


//第三步， 生成每月任务
cron.schedule('0 0 9 1 * *', async(req, res)=>{
    //第一步 生成每周任务
    let sqlStr = 'SELECT task.id from task';
    let result = await sqlQuery(sqlStr);
    let option = JSON.parse(JSON.stringify(result));
    console.log(option)
    // for(var i=0;i<option.length;i++){
        let sqlStr1 = 'INSERT into exec_item(exec_id,item_id) SELECT `name`,item_id from task_item INNER JOIN form_item on task_item.item_id=form_item.id where period LIKE "1%月"';
        await sqlQuery(sqlStr1);
        //设置数据库字段，自动获取当前时间
    // }
})

//第四步， 生成每两月任务
cron.schedule('0 0 9 1 */2 *', async(req, res)=>{
    //第一步 生成每周任务
    let sqlStr = 'SELECT task.id from task';
    let result = await sqlQuery(sqlStr);
    let option = JSON.parse(JSON.stringify(result));
    console.log(option)
    // for(var i=0;i<option.length;i++){
        let sqlStr1 = 'INSERT into exec_item(exec_id,item_id) SELECT `name`,item_id from task_item INNER JOIN form_item on task_item.item_id=form_item.id where period LIKE "2%月"';
        await sqlQuery(sqlStr1);
        //设置数据库字段，自动获取当前时间
    // }
})
//第四步， 生成每三月任务
cron.schedule('0 0 9 1 */3 *', async(req, res)=>{
    //第一步 生成每周任务
    let sqlStr = 'SELECT task.id from task';
    let result = await sqlQuery(sqlStr);
    let option = JSON.parse(JSON.stringify(result));
    console.log(option)
        let sqlStr1 = 'INSERT into exec_item(exec_id,item_id) SELECT `name`,item_id from task_item INNER JOIN form_item on task_item.item_id=form_item.id where period LIKE "3%月"';
        await sqlQuery(sqlStr1);
        //设置数据库字段，自动获取当前时间
    // }
})

//第四步， 生成每六月任务
cron.schedule('0 0 9 1 */6 *', async(req, res)=>{
    //第一步 生成每周任务
    let sqlStr = 'SELECT task.id from task';
    let result = await sqlQuery(sqlStr);
    let option = JSON.parse(JSON.stringify(result));
    console.log(option)
        let sqlStr1 = 'INSERT into exec_item(exec_id,item_id) SELECT `name`,item_id from task_item INNER JOIN form_item on task_item.item_id=form_item.id where period LIKE "6%月"';
        await sqlQuery(sqlStr1);
        //设置数据库字段，自动获取当前时间
    // }
})

//第四步， 生成每年任务
cron.schedule('0 0 9 1 1 *', async(req, res)=>{
    //第一步 生成每周任务
    let sqlStr = 'SELECT task.id from task';
    let result = await sqlQuery(sqlStr);
    let option = JSON.parse(JSON.stringify(result));
    console.log(option)
        let sqlStr1 = 'INSERT into exec_item(exec_id,item_id) SELECT `name`,item_id from task_item INNER JOIN form_item on task_item.item_id=form_item.id where period LIKE "%年"';
        await sqlQuery(sqlStr1);
        //设置数据库字段，自动获取当前时间
    // }
})



//
app.listen(32180);

