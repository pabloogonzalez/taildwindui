class HomeController < ApplicationController
  def index
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", template: "posts/show.html.erb"
      end
    end
  end
  
  def download_pdf
    respond_to do |format|
      format.pdf do
        pdf = WickedPdf.new.pdf_from_string(
          render_to_string(template: 'home/index', layout: 'pdf_layout')
        )
        send_data pdf, filename: 'nombre_del_archivo_pdf.pdf', type: 'application/pdf'
      end
    end
  end

  private
  def default_format
    request.format = :html
  end
end
