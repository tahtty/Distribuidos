require_relative './application_record'
class ImagesModel < ApplicationRecord
  validates :name, presence: true
  self.table_name = "images"
end
