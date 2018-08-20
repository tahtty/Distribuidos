class ImageController
    def self.get_top(request)
        images = []
        a = Hash.new
        a["accesos"] = 10
        a["descripcion"] = "Hola, soy Guchito"

        b = Hash.new
        b['accesos'] = 15
        b["descripcion"] = "Hola, soy Carlitos"

        relPath = "gif_prueba.gif"
        absPath = File.expand_path(relPath)
  
        File.open(absPath, "rb", File::RDONLY |
            File::NONBLOCK) do |read_file|
            image = read_file.read
            a["imagen"] = image
        end
        
        relPath = "gif_prueba2.gif"
        absPath = File.expand_path(relPath)
  
        File.open(absPath, "rb", File::RDONLY |
            File::NONBLOCK) do |read_file|
            image = read_file.read
            b["imagen"] = image
        end

        images << a
        images << b
        BuildGrpcObjects.convert_images_to_grpc_obj(images)
    end    
end