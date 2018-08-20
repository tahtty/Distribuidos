class HelloController
  def self.say_hello(request)
    Images::HelloResponse.new(
      body: "Hello Carlitos"
    )
  end
end