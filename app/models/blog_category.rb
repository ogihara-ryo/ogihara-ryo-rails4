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

class BlogCategory < ActiveRecord::Base
  belongs_to :parent, class_name: :BlogCategory, foreign_key: :parent_id
  has_many :children, class_name: :BlogCategory, dependent: :delete_all, foreign_key: :parent_id

  default_scope { order(:sort_order) }
  scope :roots, -> { where(level: 1) }
end
