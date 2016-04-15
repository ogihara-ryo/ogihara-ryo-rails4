class Admin::BlogsController < Admin::SessionController
  before_action :set_blog, only: %i(show edit update destroy)
  before_action :signin_required

  def index
    @blog_categories = BlogCategory.includes(:blogs)
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to admin_blog_path(@blog)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to admin_blog_path(@blog)
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to admin_blogs_path
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(
      :title,
      :content,
      :category_id,
      :draft
    )
  end
end
