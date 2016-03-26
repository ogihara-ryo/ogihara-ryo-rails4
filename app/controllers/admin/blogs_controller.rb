class Admin::BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end
end
