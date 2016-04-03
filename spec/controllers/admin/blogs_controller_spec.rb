require 'rails_helper'

RSpec.describe Admin::BlogsController, type: :controller do
  before { sign_in }
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

  describe 'GET #new' do
    before { get :new }
    it { is_expected.to have_http_status(:success) }
    it { expect(assigns(:blog).new_record?).to be_truthy }
  end

  describe 'POST #create' do
    context '成功の場合' do
      it 'インスタンスが1つ作成され、Show ページへリダイレクトされること' do
        expect {
          post :create, blog: attributes_for(:blog)
        }.to change(Blog, :count)
        expect(response).to redirect_to admin_blog_path(assigns[:blog])
      end
    end

    context '失敗の場合' do
      it 'インスタンスが作成されず、new テンプレートをレンダリングすること' do
        expect {
          post :create, blog: attributes_for(:blog, title: nil)
        }.to change(Blog, :count).by(0)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    before do
      @blog = create(:blog)
      get :edit, id: @blog.id
    end
    it { is_expected.to have_http_status(:success) }
    it { expect(assigns(:blog)).to eq @blog }
  end
end
