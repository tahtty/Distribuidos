# app/models

Dir[File.expand_path './app/models/*.rb'].each do |file|
  require file
end
