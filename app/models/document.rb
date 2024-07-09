class Document < ApplicationRecord
  validates :title, presence: true

  has_one_attached :file
  belongs_to :user

  def perform_ocr
    return unless file.attached?

    file_path = ActiveStorage::Blob.service.send(:path_for, file.key)
    image = RTesseract.new(file_path, lang: 'eng')
    image.to_s
    # image.to_tsv  # Getting open file of tsv
    # image.to_pdf  # Getting open file of pdf
  end
end
