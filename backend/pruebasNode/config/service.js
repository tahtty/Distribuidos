var PROTO_PATH = __dirname + '/image.proto';
var grpc = require('grpc');

var images = grpc.load(PROTO_PATH).images;
// console.log(images);
var url = "ec2-18-221-115-67.us-east-2.compute.amazonaws.com:50052"

var grpcClient = new images.ImageDetailsService(url, grpc.credentials.createInsecure(),{ 'grpc.max_send_message_length': 8 * 1024 * 1024, 'grpc.max_receive_message_length': -1 });
// console.log(grpcClient);
module.exports = {
  'grpcClient':grpcClient
}
