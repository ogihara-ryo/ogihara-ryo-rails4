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

class BlogCategory < ActiveRecord::Base
  belongs_to :parent, class_name: :BlogCategory, foreign_key: :parent_id
  has_many :children, class_name: :BlogCategory, dependent: :delete_all, foreign_key: :parent_id

  default_scope { order(:sort_order) }
  scope :roots, -> { where(parent: nil) }

  def level
    # お互いに parent を設定していると無限ループになる
    target = self
    loop.each.with_index(1) do |_, n|
      return n if target.parent.blank?
      target = target.parent
    end
  end
end
