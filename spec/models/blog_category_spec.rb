# == Schema Information
#
# Table name: blog_categories
#
#  id         :integer          not null, primary key
#  sort_order :integer
#  permalink  :string
#  name       :string
#  level      :integer
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
    it { is_expected.to respond_to(:level) }
    it { is_expected.to respond_to(:parent_id) }
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:updated_at) }
  end

  describe 'アソシエーション' do
    it { is_expected.to have_many(:children) }
    it { is_expected.to belong_to(:parent) }
  end

  describe 'スコープ' do
    it 'デフォルトの並び順が sort_order の昇順であること' do
      expect(BlogCategory.all.to_sql).to eq BlogCategory.unscoped.order(:sort_order).to_sql
    end
  end
end
