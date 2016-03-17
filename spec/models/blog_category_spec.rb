# == Schema Information
#
# Table name: blog_categories
#
#  id         :integer          not null, primary key
#  sort_order :integer
#  permalink  :string
#  name       :string
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe BlogCategory, type: :model do
  describe 'メンバー定義' do
    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:sort_order) }
    it { is_expected.to respond_to(:permalink) }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:parent_id) }
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:updated_at) }
  end

  describe 'アソシエーション' do
    it { is_expected.to have_many(:children) }
    it { is_expected.to belong_to(:parent) }
    it { is_expected.to have_many(:blogs) }
  end

  describe 'バリデーション' do
    it { is_expected.to validate_presence_of(:sort_order) }
    it { is_expected.to validate_presence_of(:permalink) }
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'スコープ' do
    describe 'default_scope' do
      it 'デフォルトの並び順が sort_order の昇順であること' do
        expect(BlogCategory.all.to_sql).to eq BlogCategory.unscoped.order(:sort_order).to_sql
      end
    end

    describe '.root' do
      it { expect(BlogCategory.roots.to_sql).to eq BlogCategory.where(parent: nil).to_sql }
    end
  end

  describe 'インスタンスメソッド' do
    describe '.level' do
      before do
        @blog_categories = create_list(:blog_category, 3)
        @blog_categories.first.parent = nil
        @blog_categories.second.parent = @blog_categories.first
        @blog_categories.third.parent = @blog_categories.second
      end

      it { expect(@blog_categories.first.level).to eq 1 }
      it { expect(@blog_categories.second.level).to eq 2 }
      it { expect(@blog_categories.third.level).to eq 3 }
    end
  end
end
