class HelloController
    def self.say_hello(request)
      Images::HelloResponse.new(
        body: "Hello #{request.name}"
      )
    end
  end