class Admin::SessionController < ApplicationController
  include Admin::SessionHelper

  before_action :signin_required
  skip_before_action :signin_required

  def new
  end

  def create
    if authenticated?(session_param[:password])
      sign_in
      redirect_back_or(admin_menu_path)
    else
      render action: :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_param
    params.require(:session).permit(:password)
  end

  # サインインが必要でリダイレクトされてきた場合は、その URL に戻してあげる
  def redirect_back_or(default)
    redirect_to(session[:request_from] || default)
    session[:request_from] = nil
  end

  # サインインしていなければ、サインインページへリダイレクト
  def signin_required
    return if signed_in?
    set_request_from
    redirect_to admin_sign_in_path
  end

  # どこのページからリクエストが来たか保存しておく
  def set_request_from
    session[:request_from] = request.fullpath
  end
end
