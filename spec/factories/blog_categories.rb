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

FactoryGirl.define do
  factory :blog_category do
    sequence(:sort_order)
    sequence(:permalink) { |n| "permalink#{n}" }
    sequence(:name) { |n| "category#{n}" }
  end
end
