# frozen_string_literal: true

module Hg
  module Assistant
    class FulfillmentController < ApplicationController
      # Handle API.ai fulfillment requests.
      def fulfill
        action     = fetch_param(:result, :metadata, :intentName) ||
                     fetch_param(:result, :action)
        parameters = fetch_param(:result, :parameters)
        message    = fetch_param(:result, :resolvedQuery)
        response   = fetch_param(:result, :fulfillment, :speech)

        puts action
        puts parameters
        puts message
        puts response
        puts user
      end
    end
  end
end
