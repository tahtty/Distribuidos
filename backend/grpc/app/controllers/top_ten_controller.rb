require 'open-uri'
require 'base64'
class ImageController
    def self.get_top(request)
        images1 = ImagesModel.order("num_acceso desc").limit(10)
        puts images1.to_sql
        
        images1.each do |item|
        # do whatever
          puts item.url
          open(item.url, "rb") do |read_file|
            image = read_file.read
              
            str = Base64.encode64(image)
            puts str
              #img = Base64.decode64(str)
              #redis.set( 'gatitos' , image )
              #img = redis.get( 'gatitos')
              #File.open("myimage2.gif", "wb") do |saved_file2|
              #    saved_file2.write(img)
              #end
              #saved_file.write(read_file.read)
          
          end
      end

        images = []
        a = Hash.new
        a["accesos"] = 10
        a["descripcion"] = "Hola, soy Guchito"

        b = Hash.new
        b['accesos'] = 15
        b["descripcion"] = "Hola, soy Carlitos"

        relPath = "gif_prueba.gif"
        absPath = File.expand_path(relPath)
  
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

        images << a
        images << b
        BuildGrpcObjects.convert_images_to_grpc_obj(images1)
    end    
end