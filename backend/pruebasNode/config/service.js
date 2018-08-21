var PROTO_PATH = __dirname + '/image.proto';
var grpc = require('grpc');
var images = grpc.load(PROTO_PATH).images;
// console.log(images);
var grpcClient = new images.ImageDetailsService('192.168.1.101:50052', grpc.credentials.createInsecure());
// console.log(grpcClient);
module.exports = {
  'grpcClient':grpcClient
}
