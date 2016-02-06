module Admin::SessionHelper
  def sign_in
    session[:login] = true
  end

  def signed_in?
    session[:login].present?
  end

  def sign_out
    session[:login] = nil
  end
end
