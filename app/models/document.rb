class Document < ApplicationRecord
  validates :title, presence: true
  
  has_one_attached :file
end
