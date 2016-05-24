module BlogsHelper
  def breadcrumbs(blog_category)
    content_tag :nav, id: 'breadcrumbs' do
      content_tag :ol do
        home_link + blog_category_link(blog_category)
      end
    end
  end

  private

  def home_link
    content_tag :li, itemscope: 'itemscope', itemtype: 'http://data-vocabulary.org/Breadcrumb' do
      link_to root_path, itemprop: 'url' do
        content_tag(:span, itemprop: 'title') { 'ホーム' }
      end
    end
  end

  def blog_category_link(blog_category)
    content_tag :li, itemscope: 'itemscope', itemtype: 'http://data-vocabulary.org/Breadcrumb' do
      link_to blog_category_path(blog_category), itemprop: 'url' do
        content_tag(:span, itemprop: 'title') { blog_category.name }
      end
    end
  end
end
