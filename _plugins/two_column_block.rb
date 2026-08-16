module Jekyll
  module Tags
    class TwoColumnBlock < Liquid::Block
      def initialize(tag_name, markup, tokens)
        super
        @markup = markup
      end

      def render(context)
        content = super
        image_path = nil
        caption = nil
        pixelated = false
        height = nil

        # Parse the markup for parameters
        if @markup =~ /image_path:\s*["']([^"']+)["']/
          image_path = $1
        end
        if @markup =~ /caption:\s*["']([^"']+)["']/
          caption = $1
        end
        if @markup =~ /pixelated:\s*(true|false)/
          pixelated = $1 == 'true'
        end
        if @markup =~ /height:\s*["']([^"']+)["']/
          height = $1
        end

        # Build image style
        img_style = ''
        img_style += 'image-rendering: pixelated;' if pixelated
        if height
          img_style += "height: #{height};"
          img_style += 'object-fit: contain;'  # Maintain aspect ratio
        else
          # Auto-fit: make image fill the available height with a minimum
          img_style += 'height: 100%;'
          img_style += 'min-height: 200px;'  # Ensure minimum size
          img_style += 'object-fit: contain;'
        end

        # Generate the HTML
        caption_html = caption ? "<figcaption class='caption'>#{caption}</figcaption>" : ''
        <<~HTML
          <div style="display: flex; gap: 2rem; align-items: stretch;">
          <div style="flex: 1;">
          #{content}
          </div>
          <div style="flex: 0 0 auto; display: flex; flex-direction: column; justify-content: center;">
          <figure style="display: flex; flex-direction: column; justify-content: center;">
          <img src="#{image_path}" loading="eager" class="img-fluid rounded z-depth-1" style="#{img_style}">
          #{caption_html}
          </figure>
          </div>
          </div>
        HTML
      end
    end
  end
end

Liquid::Template.register_tag('two_column', Jekyll::Tags::TwoColumnBlock)
