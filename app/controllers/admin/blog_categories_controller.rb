class Admin::BlogCategoriesController < Admin::SessionController
  before_action :set_blog_category, only: :show

  def index
  end

  def show
  end

  private

  def set_blog_category
    @blog_category = BlogCategory.find(params[:id])
  end
end
