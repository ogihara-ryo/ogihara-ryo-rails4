module Admin::BlogCategoriesHelper
  def render_blog_categories_hierarchy(blog_categories)
    return nil unless blog_categories.count > 0
    content_tag :ul do
      blog_categories.map do |blog_category|
        render_blog_categories_children(blog_category)
      end.join.html_safe
    end.html_safe
  end

  private

  def render_blog_categories_children(blog_category)
    content_tag(:li, link_to(blog_category.name, admin_blog_category_path(blog_category)))
      .concat(render_blog_categories_hierarchy(BlogCategory.where(parent: blog_category)))
  end
end
