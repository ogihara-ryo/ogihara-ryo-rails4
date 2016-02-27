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

  def create
    @blog_category = BlogCategory.new(blog_category_params)
    if @blog_category.save
      redirect_to admin_blog_category_path(@blog_category)
    else
      render :new
    end
  end

  private

  def set_blog_category
    @blog_category = BlogCategory.find(params[:id])
  end

  def blog_category_params
    params.require(:blog_category).permit(
      :sort_order,
      :permalink,
      :name,
      :parent_id
    )
  end
end
