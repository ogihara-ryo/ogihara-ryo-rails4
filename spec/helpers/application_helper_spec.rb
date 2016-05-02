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

  describe '#link_to_blog_category' do
    let(:blog_category) { create(:blog_category) }

    context 'ブログカテゴリーを渡された場合' do
      it 'ブログカテゴリーへのハイパーリンクを返すこと' do
        expect(link_to_blog_category(blog_category)).to eq <<-"EOS".gsub!(/(\n)/, '')
<a href=\"#{admin_blog_category_path(blog_category)}\">#{blog_category.name}</a>
        EOS
      end
    end

    context 'ブログカテゴリーを渡されなかった場合' do
      it { expect(link_to_blog_category(nil)).to eq '' }
    end
  end
end
