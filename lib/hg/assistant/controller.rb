module Hg
  module Assistant
    # TODO: Move Messenger-specific behavior out of base controller class.
    class Controller < ::Hg::Controller
      attr_accessor :response

      def respond(speech_response)
        return speech_response
      end

      # TODO: High - after filters can't effect response
    end
  end
end
