# == Schema Information
#
# Table name: blog_categories
#
#  id         :integer          not null, primary key
#  sort_order :integer
#  permalink  :string
#  name       :string
#  level      :integer
#  parent     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BlogCategory < ActiveRecord::Base
  belongs_to :parent
end
