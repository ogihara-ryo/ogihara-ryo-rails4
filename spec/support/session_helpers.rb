module SessionHelpers
  def sign_in
    session[:signed_in] = true
  end

  def signed_in?
    session[:signed_in].present?
  end

  def sign_out
    session[:signed_in] = nil
  end
end
