require 'rails_helper'

RSpec.describe Admin::BlogCategoriesHelper do
  describe '#render_blog_categories_hierarchy' do
    before do
      @blog_categories = create_list(:blog_category, 3)
      @blog_categories.first.parent = nil
      @blog_categories.second.parent = @blog_categories.first
      @blog_categories.third.parent = @blog_categories.second
    end

    subject { render_blog_categories_hierarchy(@blog_categories) }

    it { is_expected.not_to eq be_nil }
  end

  describe '#link_to_parent_blog_category' do
    subject { link_to_parent_blog_category }

    context '親カテゴリーがある場合' do
      before do
        @parent_blog_category = create(:blog_category, parent: nil)
        @child_blog_category = create(:blog_category, parent: @parent_blog_category)
      end
      it '親カテゴリーの Show ページへのリンクを返すこと' do
        expect(link_to_parent_blog_category(@child_blog_category))
          .to eq link_to(@parent_blog_category.name, admin_blog_category_path(@parent_blog_category))
      end
    end

    context '親カテゴリーがない場合' do
      before do
        @blog_category = create(:blog_category, parent: nil)
      end
      it { expect(link_to_parent_blog_category(@blog_category)).to eq I18n.t('text_none_parent') }
    end
  end
end
