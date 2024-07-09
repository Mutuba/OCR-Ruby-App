class DocumentsController < ApplicationController
  before_action :authenticate_user!

  def index    
    @documents = current_user.documents.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = current_user.documents.new(document_params)
    if @document.save
      redirect_to @document, notice: 'Document was successfully uploaded.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  

  def show
    @document = current_user.documents.find(params[:id])
    @ocr_text = @document.perform_ocr
  end

  private
  
  def document_params
    params.require(:document).permit(:title, :file)
  end
end