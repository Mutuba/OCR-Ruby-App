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
require 'rails_helper'

RSpec.describe Document, type: :model do
  let(:user) { create(:user) }
  subject { Document.new(title: "Test Document", user: user, file: fixture_file_upload('test-file.jpg', 'image/jpeg'))}
  it 'is valid' do
    expect(subject).to be_valid  
  end

  it 'invalid without title' do
    subject.title= nil
    expect(subject).not_to be_valid  
  end

  # Associations
  it { should validate_presence_of(:title) }
  it { should belong_to(:user) }
end
