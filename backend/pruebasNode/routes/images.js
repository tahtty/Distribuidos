var express = require('express');
var router = express.Router();
var ImagenesController = require('../controllers/ImageController.js');

router.get('/mejores', ImagenesController.mejores);


module.exports = router;
