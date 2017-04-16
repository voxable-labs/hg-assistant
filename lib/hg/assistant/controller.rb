module Hg
  module Assistant
    # TODO: Move Messenger-specific behavior out of base controller class.
    class Controller < ::Hg::Controller
      include ActionView::Helpers::SanitizeHelper

      attr_accessor :response

      # @see https://developers.google.com/actions/reference/webhook-format
      # TODO: allow specifying reprompts
      def respond(speech_response, display_text: nil)
        # Clean up speech responses: fix heredocs, remove linebreaks,
        # fix multiple spaces.
        speech_response = speech_response.strip_heredoc.squish

        # Use the speech response as the display text, if none provided.
        display_text = speech_response || display_text

        # Remove any SSML tags from the display text.
        display_text = strip_tags(display_text).squish

        # Generate a proper webhook fulfillment response object.
        {
          speech:       speech_response,
          display_text: display_text,
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
