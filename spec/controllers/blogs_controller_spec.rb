require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  subject { response }

  describe 'GET #index' do
    before { get :index }
    it { is_expected.to have_http_status(:success) }
  end

  describe 'GET #show' do
    let(:blog) { create(:blog) }
    before { get :show, id: blog.id }
    it { is_expected.to have_http_status(:success) }
    it { expect(assigns(:blog)).to eq blog }
  end
end
