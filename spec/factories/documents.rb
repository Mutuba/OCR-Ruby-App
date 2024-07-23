# spec/factories/documents.rb
FactoryBot.define do
  factory :document do
    title { 'Test Document' }
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/test-file.jpg'), 'image/jpeg') }
    association :user, factory: :user
  end
end