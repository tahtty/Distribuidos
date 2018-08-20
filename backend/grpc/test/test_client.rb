require_relative '../lib/protos/images_services_pb'
 
require 'grpc'
 
stub = Images::ImageDetailsService::Stub.new(
 '0.0.0.0:50052', :this_channel_is_insecure
)
 
request2 = Images::Empty.new()

response2 = stub.mejores_imagenes(request2)
request = Images::HelloRequest.new(name: "Harry")
response = stub.hello(request)
puts response.body
puts response2.images[0]["accesos"]