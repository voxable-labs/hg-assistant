# frozen_string_literal: true

module Hg
  module Assistant
    class FulfillmentController < ApplicationController
      # Handle API.ai fulfillment requests.
      def fulfill
        puts bot_request.inspect
      end
    end
  end
end
