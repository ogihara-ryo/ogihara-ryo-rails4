# == Schema Information
#
# Table name: blogs
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  category_id :integer
#  draft       :boolean          default(TRUE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Blog < ActiveRecord::Base
  belongs_to :category, class_name: :BlogCategory
  validates :title, presence: true
end
