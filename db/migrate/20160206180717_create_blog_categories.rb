class CreateBlogCategories < ActiveRecord::Migration
  def change
    create_table :blog_categories do |t|
      t.integer :sort_order
      t.string :permalink
      t.string :name
      t.integer :level
      t.integer :parent, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
