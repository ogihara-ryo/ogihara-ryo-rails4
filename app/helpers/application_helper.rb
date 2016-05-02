module ApplicationHelper
  def page_title(title)
    if title.empty?
      OgiharaRyo::Application.config.title
    else
      "#{title} | #{OgiharaRyo::Application.config.title}"
    end
  end

  def link_to_blog_category(blog_category)
    blog_category.present? ? link_to(blog_category.name, [:admin, blog_category]) : ''
  end
end
