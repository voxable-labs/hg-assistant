module Hg
  module Assistant
    class Engine < ::Rails::Engine
      isolate_namespace Hg::Assistant
    end
  end
end
