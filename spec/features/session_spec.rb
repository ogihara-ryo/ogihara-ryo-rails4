require 'rails_helper'

feature 'サインイン後のリダイレクト先' do
  scenario 'サインインページに直接アクセスした場合は管理者メニューページへ' do
    visit admin_sign_in_path
    fill_in 'session_password', with: ENV['ADMIN_PASSWORD']
    click_button I18n.t('admin.sign_in')
    expect(current_path).to eq admin_menu_path
  end

  scenario '別のページからサインインページにリダイレクトされた場合は元のページへ' do
    visit admin_blog_categories_path
    fill_in 'session_password', with: ENV['ADMIN_PASSWORD']
    click_button I18n.t('admin.sign_in')
    expect(current_path).to eq admin_blog_categories_path
  end
end
