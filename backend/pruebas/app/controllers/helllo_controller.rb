# app/controllers/hello_controller.rb
class HelloController
    def self.say_hello(request)
        StudentsDetails::HelloResponse.new(body: "Hello Pepito")
    end
end
