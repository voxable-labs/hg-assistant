module Hg
  module Assistant
    class Bot
      extend Dry::Configurable

      setting :bot_class,    reader: true
      setting :router_class, reader: true
      setting :user_class

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
      end
    end
  end
end
