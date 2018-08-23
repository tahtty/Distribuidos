const { grpcClient } = require('../config/service');
const { Buffer } = require('buffer');

module.exports = {

    mejores:function(req,res) {
      // var hello_proto = grpc.load(PROTO_PATH).helloworld();
      var noCache = req.params.noCache;
      var top = req.params.topx;
      console.log(noCache);
      console.log(top);
      grpcClient.mejoresImagenes({noCache: noCache, top:top}, function(err, response) {

        if(err) {
          res.json({'codigo':err.code,'details':err.details});
          return
        };
        // response = [{descripcion:"",accesos:"",imagen:""}]

        if(response == undefined) {
          res.json({'mensaje':'Sin respuesta del servidor'});
          return
        }

        let objeto_imagen = response.images.map(
            (elemento)=>{
              let devolver = {};
              devolver.descripcion = elemento.descripcion;
              devolver.cantidad_vistas = elemento.accesos;
              //devolver.imagen = Buffer.from(elemento.imagen).toString('base64')
              devolver.imagen = elemento.imagen;
              return devolver;
            }
        );
        res.header("Access-Control-Allow-Origin", "*");
        res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        res.json(objeto_imagen);

      });
    },
    hello:function(req,res) {
      let nombre = req.query.name;
      console.log(nombre);
      grpcClient.hello({'name':nombre},(err,response)=>{
        if(err) res.json({'codigo':err.code,'details':err.details});
        res.json(response);
      });
    }
};
