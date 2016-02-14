FactoryGirl.define do
  factory :blog_category do
    sequence(:sort_order)
    sequence(:permalink) { |n| "permalink#{n}" }
    sequence(:name) { |n| "category#{n}" }
  end
end
