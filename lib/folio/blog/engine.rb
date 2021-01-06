# frozen_string_literal: true

class Folio::Blog::Engine < ::Rails::Engine
  isolate_namespace Folio::Blog

  config.generators do |g|
    g.stylesheets false
    g.javascripts false
    g.helper false
  end

  config.assets.paths << self.root.join("app/cells")
  config.assets.paths << self.root.join("vendor/assets/javascripts")
  config.assets.paths << self.root.join("vendor/assets/bower_components")

  config.folio_console_sidebar_runner_up_link_class_names = [
    %w[Folio::Blog::Article]
  ]

  initializer :append_migrations do |app|
    unless app.root.to_s.include? root.to_s
      config.paths["db/migrate"].expanded.each do |expanded_path|
        app.config.paths["db/migrate"] << expanded_path
      end
    end
  end
end
