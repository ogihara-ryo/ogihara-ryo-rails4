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

  describe 'POST #create' do
    context '成功の場合' do
      it 'BlogCategory インスタンスが1つ作成され、Show ページへリダイレクトされること' do
        expect {
          post :create, blog_category: attributes_for(:blog_category)
        }.to change(BlogCategory, :count)
        expect(response).to redirect_to admin_blog_category_path(assigns[:blog_category])
      end
    end
  end

  describe 'GET #edit' do
    before do
      @blog_category = create(:blog_category)
      get :edit, id: @blog_category.id
    end
    it { is_expected.to have_http_status(:success) }
    it { expect(assigns(:blog_category)).to eq @blog_category }
  end
end
