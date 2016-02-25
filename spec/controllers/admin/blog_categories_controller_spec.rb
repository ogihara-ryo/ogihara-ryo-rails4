require 'rails_helper'

RSpec.describe Admin::BlogCategoriesController, type: :controller do
  before { sign_in }
  subject { response }

  describe 'GET #index' do
    before { get :index }
    it { is_expected.to have_http_status(:success) }
  end

  describe 'GET #show' do
    before do
      @blog_category = create(:blog_category)
      get :show, id: @blog_category.id
    end
    it { is_expected.to have_http_status(:success) }
    it { expect(assigns(:blog_category)).to eq @blog_category }
  end

  describe 'GET #new' do
    before { get :new }
    it { is_expected.to have_http_status(:success) }
    it { expect(assigns(:blog_category).new_record?).to be_truthy }
  end
end
