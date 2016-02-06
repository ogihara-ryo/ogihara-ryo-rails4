require 'rails_helper'

RSpec.describe Admin::MenuController, type: :controller do
  subject { response }

  describe 'GET #index' do
    before { get :index }
    it { is_expected.to have_http_status(:success) }
  end
end
