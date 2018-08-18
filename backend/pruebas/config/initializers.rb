# config/initializers.rb
Dir[File.expand_path './config/initializers/*.rb'].each do |file|
  require file
end
