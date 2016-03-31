class Admin::BlogsController < ApplicationController
  before_action :set_blog, only: %i(show)

  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
