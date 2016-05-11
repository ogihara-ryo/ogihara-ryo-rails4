module MarkdownHelper
  def md_to_html(mk_code, extentions = {}, render_options = {})
    Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(render_options),
      extentions
    ).render(mk_code || '').html_safe
  end
end
