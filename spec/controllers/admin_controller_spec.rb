require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  subject { response }

  describe 'GET #menu' do
    before { get :menu }
    it { is_expected.to have_http_status(:success) }
  end
end
