# frozen_string_literal: true

# Ensure that the bot's config is loaded.
require_dependency Rails.root.join('config', 'initializers', 'assistant_bot.rb')

module Hg
  module Assistant
    class FulfillmentController < ApplicationController
      # Handle API.ai fulfillment requests.
      def fulfill
        fulfillment_response = bot.router.handle(bot_request)

        logger.info fulfillment_response.inspect if Rails.env.development?

        render json: fulfillment_response.to_json
      end
    end
  end
end
