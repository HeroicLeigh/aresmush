module AresMUSH
  module Api
    class PingResponseHandler < ApiResponseHandler
      def handle   
        Global.logger.info "Game registration successfully updated."
      end
    end
  end
end