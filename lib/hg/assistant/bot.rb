module Hg
  module Assistant
    class Bot
      extend Dry::Configurable

      setting :bot_class, reader: true
      setting :user_class

      class << self
        def configure(&block)
          yield config
        end

        def user_class
          # TODO: Ensure config returns default user_class
          config.user_class || Kernel.const_get(:User)
        end
      end
    end
  end
end
