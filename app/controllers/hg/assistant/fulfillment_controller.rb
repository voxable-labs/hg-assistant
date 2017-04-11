# frozen_string_literal: true

module Hg
  module Assistant
    class FulfillmentController < ApplicationController
      before_action :find_bot_user

      # Handle API.ai fulfillment requests.
      def fulfill
        puts @user.inspect
      end

      private

      # Find the appropriate user for this request.
      #
      # @return [Object] The user that initiated the request.
      def find_bot_user
        user_id = params['originalRequest']['data']['user']['user_id']

        @user = Hg::Assistant::Bot.bot_class
                                  .user_class
                                  .find_or_create_by(google_user_id: user_id)
      end
    end
  end
end
