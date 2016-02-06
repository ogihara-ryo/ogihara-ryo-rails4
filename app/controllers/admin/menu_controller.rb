class Admin::MenuController < Admin::SessionController
  before_action :signin_required

  def index
  end
end
