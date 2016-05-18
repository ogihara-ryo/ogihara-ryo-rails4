class BlogsController < ApplicationController
  before_action :set_blog, only: :show

  def index
    @blog_categories = BlogCategory.includes(:blogs)
  end

  def show
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
