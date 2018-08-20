require 'open-uri'
require 'base64'
class ImageController
    def self.get_top(request)
        images1 = ImagesModel.order("num_acceso desc").limit(10)
        puts images1.to_sql
        images2 = []
        images1.map { |item|
        # do whatever
            obj = Hash.new
            
            open(item.url, "rb") do |read_file|
                image = read_file.read
                obj['imagen'] = image 
            end
            
            obj['descripcion'] = item.descripcion
            obj['accesos'] = item.num_acceso
            images2 << obj
        }

        images = []
        a = Hash.new
        a["accesos"] = 10
        a["descripcion"] = "Hola, soy Guchito"

        b = Hash.new
        b['accesos'] = 15
        b["descripcion"] = "Hola, soy Carlitos"

        #File.open(absPath, "rb", File::RDONLY |
        #    File::NONBLOCK) do |read_file|
        #    image = read_file.read
        #    a["imagen"] = image
        #end
        
        #relPath = "gif_prueba2.gif"
        #absPath = File.expand_path(relPath)
  
        #File.open(absPath, "rb", File::RDONLY |
        #    File::NONBLOCK) do |read_file|
        #    image = read_file.read
        #    b["imagen"] = image
        #end

        BuildGrpcObjects.convert_images_to_grpc_obj(images2)
    end    
end