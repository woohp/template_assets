module TemplateAssets
  module ViewHelpers
    def template_assets
      if Rails.cache.exist? '_asset_templates'
        return Rails.cache.read '_asset_templates'
      end

      assets_dir_length = Rails.root.join("app", "assets", "templates").to_s.length + 1

      results = []
      Dir.glob Rails.root.join("app", "assets", "templates", '**', "*html*") do |f|
        f = f.to_s

        # render
        template = Tilt.new(f).render()

        # create the id
        f = f[assets_dir_length..-1]
        ext = File.extname(f)
        while ext.length > 0
          f = f[0..-ext.length-1]
          ext = File.extname(f)
        end

        results << "<script type='text/ng-template' id='#{f}'>#{template}</script>".html_safe
      end

      output = safe_join(results)

      # cache
      Rails.cache.write '_assets_templates', output

      return output
    end
  end
end

ActionView::Base.send :include, TemplateAssets::ViewHelpers
