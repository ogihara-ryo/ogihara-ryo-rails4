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
end
