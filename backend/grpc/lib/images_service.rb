require 'rubygems'
require 'bundler/setup'
 
Bundler.require(:default)
 
require './lib/protos/images_services_pb'
require './app'
 
class ImageDetailsService < Images::ImageDetailsService::Service
    def hello(request, _unused_call)
        HelloController.say_hello(request)
    end

    def mejores_imagenes(request, _unused_call)
        ImageController.get_top(request)
    end    

end