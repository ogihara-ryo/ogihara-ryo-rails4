class Admin::BlogsController < ApplicationController
  before_action :set_blog, only: %i(show edit update)

  def index
    @blogs = Blog.all
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
