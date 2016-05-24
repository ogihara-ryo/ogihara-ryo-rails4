module ApplicationHelper
  def page_title(title)
    if title.empty?
      OgiharaRyo::Application.config.title
    else
      "#{title} | #{OgiharaRyo::Application.config.title}"
    end
  end

  def link_to_blog_category(blog_category, admin: false)
    return '' if blog_category.blank?
    link_to blog_category.name, [admin ? :admin : nil, blog_category]
  end
end
