var express = require('express');
var router = express.Router();
var ImagenesController = require('../controllers/ImageController.js');

router.get('/mejores/:noCache/:topx', ImagenesController.mejores);
router.get('/hello', ImagenesController.hello);


module.exports = router;
