module ForumPostsHelper
  def markdownify(content)
    # Asset root for emoji icon locations.
    pipeline_context = { mf: true, asset_root: 'https://github.githubassets.com/images/icons/' }

    # Filters posts content to apply markdown and emoji styling
    pipeline = HTML::Pipeline.new [
      # Adds markdown support
      HTML::Pipeline::MarkdownFilter,
      # Adds emoji support
      HTML::Pipeline::EmojiFilter,
      # Prevents bad code from being parsed
      HTML::Pipeline::SanitizationFilter,
    ], pipeline_context

    # Replaces content with html, html_safe allows us to render the html on the webpage.
    pipeline.call(content)[:output].to_s.html_safe
  end
end
