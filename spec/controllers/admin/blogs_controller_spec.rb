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
        expect(response).to redirect_to blog_path(assigns[:blog])
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

  describe 'POST #update' do
    before do
      @blog_category1, @blog_category2 = create_list(:blog_category, 2)
      @blog = create(:blog, category: @blog_category1)
    end
    context '成功の場合' do
      before do
        patch :update, id: @blog, blog: attributes_for(
          :blog,
          title: 'update_title',
          content: 'update_content',
          category_id: @blog_category2.id,
          draft: true
        )
      end
      subject { @blog.reload }
      it '各属性が更新され、Show ページへリダイレクトされること' do
        expect(subject.title).to eq 'update_title'
        expect(subject.content).to eq 'update_content'
        expect(subject.category_id).to eq @blog_category2.id
        expect(subject.draft).to eq true
        expect(response).to redirect_to blog_path(assigns[:blog])
      end
    end

    context '失敗の場合' do
      before { patch :update, id: @blog, blog: attributes_for(:blog, title: nil) }
      it { is_expected.to render_template(:edit) }
    end
  end

  describe 'DELETE #destroy' do
    before { @blog = create(:blog) }
    it 'インスタンスが1つ削除され、Index ページへリダイレクトされること' do
      expect {
        delete :destroy, id: @blog
      }.to change(Blog, :count).by(-1)
      expect(response).to redirect_to blogs_path
    end
  end
end
