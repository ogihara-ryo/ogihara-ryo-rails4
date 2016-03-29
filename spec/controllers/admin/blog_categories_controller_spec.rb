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
      it 'インスタンスが1つ作成され、Show ページへリダイレクトされること' do
        expect {
          post :create, blog_category: attributes_for(:blog_category)
        }.to change(BlogCategory, :count)
        expect(response).to redirect_to admin_blog_category_path(assigns[:blog_category])
      end
    end

    context '失敗の場合' do
      it 'インスタンスが作成されず、new テンプレートをレンダリングすること' do
        expect {
          post :create, blog_category: attributes_for(:blog_category, permalink: nil)
        }.to change(BlogCategory, :count).by(0)
        expect(response).to render_template(:new)
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

  describe 'POST #update' do
    before do
      @parent = create(:blog_category)
      @blog_category = create(:blog_category)
    end
    context '成功の場合' do
      before do
        patch :update, id: @blog_category, blog_category: attributes_for(
          :blog_category,
          sort_order: 9,
          permalink: 'update_permalink',
          name: 'update_name',
          parent_id: @parent
        )
      end
      subject { @blog_category.reload }
      it '各属性が更新され、Show ページへリダイレクトされること' do
        expect(subject.sort_order).to eq 9
        expect(subject.permalink).to eq 'update_permalink'
        expect(subject.name).to eq 'update_name'
        expect(subject.parent_id).to eq @parent.id
        expect(response).to redirect_to admin_blog_category_path(assigns[:blog_category])
      end
    end

    context '失敗の場合' do
      before { patch :update, id: @blog_category, blog_category: attributes_for(:blog_category, permalink: nil) }
      it { is_expected.to render_template(:edit) }
    end
  end

  describe 'DELETE #destroy' do
    before { @blog_category = create(:blog_category) }
    it 'インスタンスが1つ削除され、Index ページへリダイレクトされること' do
      expect {
        delete :destroy, id: @blog_category
      }.to change(BlogCategory, :count).by(-1)
      expect(response).to redirect_to admin_blog_categories_path
    end
  end
end
