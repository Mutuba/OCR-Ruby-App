require 'rails_helper'

RSpec.describe Document, type: :model do
  subject { Document.new(title: "Test Document")}
  it 'is valid' do
    expect(subject).to be_valid  
  end

  it 'invalid without title' do
    subject.title= nil
    expect(subject).not_to be_valid  
  end

  #Associations
  # it { should have_one_attached(:file) }
end