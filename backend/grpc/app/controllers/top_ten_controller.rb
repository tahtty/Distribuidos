require 'open-uri'
require 'base64'
require 'json'
require "base64"
require "./server"
class ImageController
    def self.get_top(request)
        noCache = request.noCache
        top = request.top
        fecha = Time.now.strftime("%Y-%m-%d") + ":#{top}"
        puts fecha
        #redis = Redis.new
        #redis.set("foo","check")

        contador = ImagesServer.cache.llen(fecha)
        puts contador
        if (contador == 0 || noCache == 1)
            puts "no-cache"
            images1 = ImagesModel.distinct.order("num_acceso desc").limit(top)
            puts images1.to_sql
            images2 = []
            images1.map { |item|
            # do whatever
                obj = Hash.new
                
                #open(item.url, "rb") do |read_file|
                    #image = read_file.read
                    #obj['imagen'] = Base64.encode64( image )
                    #obj['imagen'] =  image
                #end
                obj['imagen'] =  item.url
                # puts item.num_acceso
                 #puts obj['imagen']
                obj['descripcion'] = item.descripcion
                obj['accesos'] = item.num_acceso
                images2 << obj
            }
            ImagesServer.cache.lpush(fecha,images2)
            ImagesServer.cache.expire(fecha,86400)
            
            BuildGrpcObjects.convert_images_to_grpc_obj(images2)
            #https://redis.io/topics/data-types-intro
        else
            puts "cache"
            #imagesRE = JSON.parse(imagesR)
            #puts imagesR
            imagesR = ImagesServer.cache.lrange(fecha,0,top - 1)
            # puts imagesR
            imagesR2 = []
            imagesR.map { |item|
            # do whatever
                # puts item[-30..-1]
                obj = JSON.parse item.gsub('=>', ':')
                # puts obj['accesos']
                # puts obj['descripcion']
                
                # obj['imagen'] = obj['imagen'].force_encoding(Encoding::ASCII_8BIT)
                #puts obj['imagen']
                # obj = Hash.new
                # puts item
                # open(item.url, "rb") do |read_file|
                #     image = read_file.read
                #     obj['imagen'] = image 
                # end
                # obj['imagen'] = item.imagen.encode(Encoding::ISO_8859_1)
                # obj['descripcion'] = item.descripcion
                # obj['accesos'] = item.num_acceso
                imagesR2.unshift(obj)
            }
            BuildGrpcObjects.convert_images_to_grpc_obj(imagesR2)
        end
        
    end    
end