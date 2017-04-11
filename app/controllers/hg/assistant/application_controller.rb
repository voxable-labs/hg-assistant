module Hg
  module Assistant
    class ApplicationController < ActionController::Base

      private

      # Find the appropriate user for this request.
      #
      # @return [Object] The user that initiated the request.
      def user
        user_id = fetch_param(:originalRequest, :data, :user, :user_id)

        @user ||= Hg::Assistant::Bot.bot_class
                    .user_class
                    .find_or_create_by(google_user_id: user_id)
      end

      # Generate an `Hg::Request` from the API.ai fulfillment request.
      #
      # @return [Hg::Request] The generated request.
      def bot_request
        intent = fetch_param(:result, :metadata, :intentName)

        @bot_request ||= Hg::Request.new(
          user:       user,
          message:    fetch_param(:result, :resolvedQuery),
          intent:     intent,
          action:     intent || fetch_param(:result, :action),
          parameters: fetch_param(:result, :parameters),
          response:   fetch_param(:result, :fulfillment, :speech)
        )
      end

      # https://gist.github.com/jalkoby/6869556
      def fetch_param(*list)
        result = params
        list.each do |key|
          result = result[key]
          return if result.nil?
        end
        result
      end
    end
  end
end
