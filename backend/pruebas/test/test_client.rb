require_relative '../lib/protos/students_details_services_pb'

require 'grpc'

stub = Images::ImageDetailsService::Stub.new(
 '192.168.1.101:50052', :this_channel_is_insecure
)

request = Images::Empty.new();
response = stub.hello(request)
puts response.body
