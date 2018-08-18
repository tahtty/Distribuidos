require 'open-uri'
require 'base64'
require 'redis'

redis = Redis.new

File.open("myimage.gif", "wb") do |saved_file|
  # the following "open" is provided by open-uri
  open("https://38.media.tumblr.com/9ead028ef62004ef6ac2b92e52edd210/tumblr_nok4eeONTv1s2yegdo1_400.gif", "rb") do |read_file|
    image = read_file.read
    saved_file.write(image)
    #str = Base64.encode64(image)
    #img = Base64.decode64(str)
    redis.set( 'gatitos' , image )
    img = redis.get( 'gatitos')
    File.open("myimage2.gif", "wb") do |saved_file2|
        saved_file2.write(img)
    end
    #saved_file.write(read_file.read)
  end
end
puts "Done."
