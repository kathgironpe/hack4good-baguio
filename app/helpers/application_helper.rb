module ApplicationHelper
  def to_html(text)
    Kramdown::Document.new(text).to_html.html_safe
  end


  def nav_link(text, path)
    options = current_page?(path) ? { class: 'active' } : {}
    content_tag(:li, options) do
      link_to text, path
    end
  end
end
