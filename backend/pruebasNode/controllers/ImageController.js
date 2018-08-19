const { grpcClient } = require('../config/service');
const { Buffer } = require('buffer');

module.exports = {

    mejores:function(req,res) {
      // var hello_proto = grpc.load(PROTO_PATH).helloworld();
      grpcClient.mejoresImagenes({}, function(err, response) {

        if(err) res.json({'codigo':err.code,'details':err.details});
        // response = [{descripcion:"",accesos:"",imagen:""}]
        console.log(response);
        let objeto_imagen = response.images.map(
            (elemento)=>{
              let devolver = {};
              devolver.descripcion = elemento.descripcion;
              devolver.cantidad_vistas = elemento.accesos;
              devolver.imagen = Buffer.from(elemento.imagen).toString('base64')
              return devolver;
            }
        );

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
