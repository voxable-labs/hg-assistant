module Hg
  module Assistant
    class Bot
      extend Dry::Configurable

      # The class for the bot itself.
      setting :bot_class,    reader: true
      # The router for the bot.
      setting :router_class, reader: true
      # The class representing users.
      setting :user_class
      # The field on the user class representing the context for this bot.
      setting :user_context_field

      class << self
        def configure(&block)
          yield config
        end

        # @return [Class] The bot's router class.
        def router
          config.router_class ||= const_get(:Router)
        rescue LoadError
          raise NoRouterClassExistsError.new
        end

        def user_class
          # TODO: Ensure config returns default user_class
          config.user_class || Kernel.const_get(:User)
        end

        def user_context_field
          config.user_context_field || :context
        end
      end
    end
  end
end
