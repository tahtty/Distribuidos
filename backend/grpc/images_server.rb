require 'rubygems'
require 'bundler/setup'
require_relative 'lib/images_service'

require 'logging'
Bundler.require(:default)
 
module GRPC
  extend Logging.globally
end
 
Logging.logger.root.appenders = Logging.appenders.stdout
Logging.logger.root.level = :info
 
 
class ImagesServer
  class << self
    def start
      start_grpc_server
    end
 
    private
 
    def start_grpc_server
      @server = GRPC::RpcServer.new
      @server.add_http2_port('0.0.0.0:50052', :this_port_is_insecure)
      @server.handle(ImageDetailsService)
      @server.run_till_terminated
    end
  end
end
 
ImagesServer.start