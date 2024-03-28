class ApplicationController < ActionController::Base
    rescue_from ActionController::UnknownFormat, with: :handle_unknown_format

    private
  
    def handle_unknown_format
      respond_to do |format|
        format.html { render plain: 'Formato de solicitud desconocido', status: :unsupported_media_type }
        format.any  { head :unsupported_media_type }
      end
    end
end
