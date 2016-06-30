class AddImageToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :image, :integer
  end
end
