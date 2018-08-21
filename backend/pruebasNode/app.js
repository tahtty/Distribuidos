var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

var fs = require('fs');
var nodePrd = require('node-prd');

var cors = require('cors');

var app = express();

app.use(bodyParser.json());

var originsWhitelist = [
  'http://localhost:4200'
];
var corsOptions = {
  origin: function(origin, callback){
    var isWhitelisted = originsWhitelist.indexOf(origin) !== -1;
    callback(null, isWhitelisted);
  },
  credentials:true
};
//here is the magic

//app.use(cors(corsOptions)); //se quito esto 27 de Abril
//app.options('*',cors()); // se puso esto 27 de Abril

app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());

// Point static path to dist
app.use(express.static(path.join(__dirname, 'dist')));

///////////////////////////////////////////// se agregaron estas 6 lineas el 27 de abril
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, Content-Length, X-Requested-With, Content-Type, Accept, Authorization, x-access-token, X-HTTP-Method-Override");
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,PATCH,OPTIONS');
  next();
});


// Set our api routes
require('./routes/index.js')(app);

// Catch all other routes and return the index file
app.get('*', function(req, res){
  res.json({title: "Error 404 - Route not found", message: "The specified path doesn`t exist."})
});

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  console.log(err);
  res.send('error');
});

module.exports = app;
