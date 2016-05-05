require 'rails_helper'

RSpec.describe Admin::BlogCategoriesHelper do
  describe '#render_blog_categories_hierarchy' do
    subject { render_blog_categories_hierarchy(blog_categories) }

    let(:blog_categories) { create_list(:blog_category, 3) }

    before do
      blog_categories.first.parent = nil
      blog_categories.second.parent = blog_categories.first
      blog_categories.third.parent = blog_categories.second
    end

    it do
      is_expected.to eq <<-'EOS'.gsub!(/(\n)/, '')
<ul>
<li><a href="/admin/blog_categories/1">category1</a></li>
<li><a href="/admin/blog_categories/2">category2</a></li>
<li><a href="/admin/blog_categories/3">category3</a></li>
</ul>
      EOS
    end
  end

  describe '#link_to_parent_blog_category' do
    subject { link_to_parent_blog_category }

    context '親カテゴリーがある場合' do
      let(:parent_blog_category) { create(:blog_category, parent: nil) }
      let(:child_blog_category) { create(:blog_category, parent: parent_blog_category) }

      it '親カテゴリーの Show ページへのリンクを返すこと' do
        expect(link_to_parent_blog_category(child_blog_category))
          .to eq link_to(parent_blog_category.name, admin_blog_category_path(parent_blog_category))
      end
    end

    context '親カテゴリーがない場合' do
      let(:blog_category) { create(:blog_category, parent: nil) }

      it { expect(link_to_parent_blog_category(blog_category)).to eq I18n.t('text_none_parent') }
    end
  end
end
