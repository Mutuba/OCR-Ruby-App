class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to @document, notice: 'Document was successfully uploaded.'
    else
      render :new
    end
  end

  def show
    @document = Document.find(params[:id])
    @ocr_text = @document.perform_ocr
  end

  private

  def parse_tsv(file)
    tsv_content = file.download
    rows = tsv_content.split("\n").map { |row| row.split("\t") }
    rows
  end
  
  def document_params
    params.require(:document).permit(:title, :file)
  end
end