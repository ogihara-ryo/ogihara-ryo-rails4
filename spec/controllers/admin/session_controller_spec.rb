require 'rails_helper'

RSpec.describe Admin::SessionController, type: :controller do
  subject { response }

  describe 'GET #new' do
    before { get :new }
    it { is_expected.to have_http_status(:success) }
  end

  describe 'POST #create' do
    context '入力されたパスワードが正しい場合' do
      before do
        sign_out
        post :create, session: { password: ENV['ADMIN_PASSWORD'] }
      end
      it { is_expected.to redirect_to admin_menu_path }
      it { expect(controller.view_context.signed_in?).to be_truthy }
    end

    context '入力されたパスワードが誤っている場合' do
      before { post :create, session: { password: 'invalid_password' } }
      it { is_expected.not_to redirect_to admin_menu_path }
      it { is_expected.to render_template :new }
    end
  end

  describe 'DELETE #destroy' do
    before { delete :destroy }
    it { is_expected.to redirect_to root_path }
  end
end
