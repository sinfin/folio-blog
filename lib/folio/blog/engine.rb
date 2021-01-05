module Folio
  module Blog
    class Engine < ::Rails::Engine
      isolate_namespace Folio::Blog
    end
  end
end
