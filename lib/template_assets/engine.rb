module TemplateAssets
  class Engine < Rails::Engine
    config.template_assets = ActiveSupport::OrderedOptions.new
    config.template_assets.cache = false
  end
end
