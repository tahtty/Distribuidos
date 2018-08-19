const { grpcClient } = require('../config/service');
const grpcExpress = require('grpc-express');


module.exports = function(app) {
    // console.log(grpcClient);
    app.use(grpcExpress(grpcClient));

    app.use('/images',require('./images'));

    app.get('/', function (req, res) {
        res.json({message: 'Server working!'});
    });
};
