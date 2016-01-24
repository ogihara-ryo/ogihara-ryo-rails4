require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#page_title' do
    context 'ページタイトルを渡された場合' do
      it '[ページタイトル | アプリケーション名] を返すこと' do
        expect(page_title('タイトル')).to eq("タイトル | #{OgiharaRyo::Application.config.title}")
      end
    end

    context 'ページタイトルを渡されなかった場合' do
      it '[アプリケーション名] を返すこと' do
        expect(page_title('')).to eq(OgiharaRyo::Application.config.title)
      end
    end
  end
end
