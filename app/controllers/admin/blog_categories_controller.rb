class Admin::BlogCategoriesController < Admin::SessionController
  before_action :set_blog_category, only: :show
  before_action :signin_required

  def index
  end

  def show
  end

  def new
    @blog_category = BlogCategory.new
  end

  private

  def set_blog_category
    @blog_category = BlogCategory.find(params[:id])
  end
end
