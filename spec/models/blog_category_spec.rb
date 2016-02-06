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

require 'rails_helper'

RSpec.describe BlogCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
