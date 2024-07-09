require 'rails_helper'

RSpec.describe "DocumentsController", type: :request do
  let(:user) { create(:user) }
  let!(:document) { create(:document, user: user) }

  before do
    sign_in user
  end

  describe 'GET /documents' do
    it 'returns a successful response' do
      get documents_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Documents')
    end
  end

  describe 'GET /documents/new' do
    it 'returns a successful response' do
      get new_document_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /documents' do
    let(:valid_params) { { document: { title: 'Test Document', file: fixture_file_upload('test-file.jpg', 'image/jpeg') } } }
    let(:invalid_params) { { document: { title: '', file: nil } } }

    context 'with valid parameters' do
      it 'creates a new document' do
        expect {
          post documents_path, params: valid_params
        }.to change(Document, :count).by(1)
        expect(response).to redirect_to(document_path(Document.last))
        follow_redirect!
        expect(response.body).to include('Document was successfully uploaded.')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new document' do
        expect {
          post documents_path, params: invalid_params
        }.to change(Document, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /documents/:id' do
    it 'returns a successful response' do
      get document_path(document)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(document.title)
    end
  end
end
