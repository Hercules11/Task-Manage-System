var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/qr', function(req, res, next) {
  res.render('admin/util/qr.ejs');
});

module.exports = router;