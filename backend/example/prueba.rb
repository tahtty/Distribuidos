require 'open-uri'

File.open("myimage.gif", "wb") do |saved_file|
  # the following "open" is provided by open-uri
  open("https://38.media.tumblr.com/9ead028ef62004ef6ac2b92e52edd210/tumblr_nok4eeONTv1s2yegdo1_400.gif", "rb") do |read_file|
    saved_file.write(read_file.read)
  end
end
puts "Done."
