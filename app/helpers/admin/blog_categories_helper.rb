module Admin::BlogCategoriesHelper
  def render_blog_categories_hierarchy(blog_categories)
    if blog_categories.count > 0
      html = '<ul>'
      blog_categories.each do |blog_category|
        html += '<li>'
        html += link_to blog_category.name, admin_blog_category_path(blog_category)
        html += '</li>'
        child_blog_categories = BlogCategory.where(parent: blog_category)
        if child_blog_categories.count > 0
          html += render_blog_categories_hierarchy(child_blog_categories)
        end
      end
      html += '</ul>'
    end
    html.html_safe
  end
end
