require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  subject { response }

  describe 'GET #index' do
    before { get :index }
    it { is_expected.to have_http_status(:success) }
  end

  describe 'GET #show' do
    before do
      @blog = create(:blog)
      get :show, id: @blog.id
    end
    it { is_expected.to have_http_status(:success) }
    it { expect(assigns(:blog)).to eq @blog }
  end
end
