module BuildGrpcObjects
    class << self
      def convert_images_to_grpc_obj(images)
        images_grpc_obj = Images::Images.new(images: [])
        images.collect do |image|
          images_grpc_obj.images << convert_img_to_grpc_obj(image)
        end
        images_grpc_obj
      end
  
      def convert_img_to_grpc_obj(image)
        Images::Image.new(
          accesos: image["accesos"],
          descripcion: image["descripcion"],
          imagen: image["imagen"]
        )
      end
    end
  end