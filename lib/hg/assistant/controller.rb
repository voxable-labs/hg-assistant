module Hg
  module Assistant
    # TODO: Move Messenger-specific behavior out of base controller class.
    class Controller < ::Hg::Controller
      attr_accessor :response

      # @see https://developers.google.com/actions/reference/webhook-format
      # TODO: allow specifying reprompts
      def respond(speech_response, display_text: nil)
        {
          speech:               speech_response,
          display_text:         (speech_response || display_text),
          data: {
            google: {
              expect_user_response: false
            }
          }
        }
      end

      # TODO: High - after filters can't effect response
    end
  end
end
