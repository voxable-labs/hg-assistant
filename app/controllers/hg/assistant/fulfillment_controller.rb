# frozen_string_literal: true

module Hg
  module Assistant
    class FulfillmentController < ApplicationController
      # Handle API.ai fulfillment requests.
      def fulfill
        speech_response = bot.router.handle(bot_request)

        fulfillment_response = {
          speech:       speech_response,
          display_text: speech_response
        }

        logger.info fulfillment_response.inspect if Rails.env.development?

        render json: fulfillment_response.to_json
      end
    end
  end
end
