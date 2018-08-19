const { grpcClient } = require('../config/service');

module.exports = {

    mejores:function(req,res) {
      // var hello_proto = grpc.load(PROTO_PATH).helloworld();
      grpcClient.hello({}, function(err, response) {
      res.json({"Mensaje":response.body});
    });
      // res.json({"img":"top10"});
    }
};
