BlogCategory.delete_all
BlogCategory.connection.execute(%|SELECT setval ('blog_categories_id_seq', 1, false)|)
Blog.delete_all
Blog.connection.execute(%|SELECT setval ('blogs_id_seq', 1, false)|)

1.upto(3).each do |i|
  parent = BlogCategory.create(
    sort_order: i,
    permalink: "permalink#{i}",
    name: "category#{i}"
  )
  1.upto(3).each do |j|
    child = BlogCategory.create(
      sort_order: j,
      permalink: "permalink#{i}-#{j}",
      name: "category#{i}-#{j}",
      parent: parent
    )
    1.upto(3).each do |k|
      BlogCategory.create(
        sort_order: k,
        permalink: "permalink#{i}-#{j}-#{k}",
        name: "category#{i}-#{j}-#{k}",
        parent: child
      )
    end
  end
end

BlogCategory.all.each do |blog_category|
  1.upto(3).each do |i|
    Blog.create(
      title: "#{blog_category.name}-title#{i}",
      content: "#{blog_category.name}-content#{i}",
      category: blog_category,
      draft: i.even?
    )
  end
end
