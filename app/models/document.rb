# == Schema Information
#
# Table name: documents
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
class Document < ApplicationRecord
  validates :title, presence: true

  has_one_attached :file
  belongs_to :user

  validates :file, content_type: [:gif, :png, :jpg, :jpeg]


  def perform_ocr
    return unless file.attached?

    file_path = ActiveStorage::Blob.service.send(:path_for, file.key)
    image = RTesseract.new(file_path, lang: 'eng')
    image.to_s
    # image.to_tsv  # Getting open file of tsv
    # image.to_pdf  # Getting open file of pdf
  end
end
