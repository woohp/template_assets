module TemplateAssets
  module ViewHelpers
    def template_assets
      assets_dir_length = Rails.root.join("app", "assets", "templates").to_s.length + 1

      results = []
      Dir.glob Rails.root.join("app", "assets", "templates", '**', "*html*") do |f|
        f = f.to_s
        template = Tilt.new(f).render()

        ext = File.extname(f)
        f = f[assets_dir_length, f.length - assets_dir_length - ext.length]

        results << "<script type='text/ng-template' id='#{f}'>#{template}</script>".html_safe
      end

      safe_join(results)
    end
  end
end

ActionView::Base.send :include, TemplateAssets::ViewHelpers
