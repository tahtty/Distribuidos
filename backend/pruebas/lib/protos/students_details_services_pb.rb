# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: students_details.proto for package 'images'

require 'grpc'
require_relative 'students_details_pb'

module Images
  module ImageDetailsService
    class Service

      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'images.ImageDetailsService'

      rpc :Hello, HelloRequest, HelloResponse
    end

    Stub = Service.rpc_stub_class
  end
end
