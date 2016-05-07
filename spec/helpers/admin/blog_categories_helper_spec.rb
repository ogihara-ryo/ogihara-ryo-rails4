require 'rails_helper'

RSpec.describe Admin::BlogCategoriesHelper do
  describe '#render_blog_categories_hierarchy' do
    subject { render_blog_categories_hierarchy(blog_categories.select { |blog_category| blog_category.level == 1 }) }

    let(:blog_categories) { create_list(:blog_category, 3) }

    context '階層がない場合' do
      it '1つの ul 要素に内包した3つの li 要素を返すこと' do
        is_expected.to eq <<-"EOS".gsub!(/(\n)/, '')
<ul>
<li><a href=\"/admin/blog_categories/#{blog_categories.first.id}\">#{blog_categories.first.name}</a></li>
<li><a href=\"/admin/blog_categories/#{blog_categories.second.id}\">#{blog_categories.second.name}</a></li>
<li><a href=\"/admin/blog_categories/#{blog_categories.third.id}\">#{blog_categories.third.name}</a></li>
</ul>
        EOS
      end
    end

    context '3階層の場合' do
      before do
        blog_categories.first.parent = nil
        blog_categories.second.update_attributes(parent: blog_categories.first)
        blog_categories.third.update_attributes(parent: blog_categories.second)
      end

      it 'blog_categories の階層構造と ul 要素と li 要素の階層構造が等しいこと' do
        is_expected.to eq <<-"EOS".gsub!(/(\n)/, '')
<ul><li><a href=\"/admin/blog_categories/#{blog_categories.first.id}\">#{blog_categories.first.name}</a></li>
<ul><li><a href=\"/admin/blog_categories/#{blog_categories.second.id}\">#{blog_categories.second.name}</a></li>
<ul><li><a href=\"/admin/blog_categories/#{blog_categories.third.id}\">#{blog_categories.third.name}</a></li>
</ul>
</ul>
</ul>
        EOS
      end
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
