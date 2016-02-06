BlogCategory.delete_all
BlogCategory.connection.execute(%|SELECT setval ('blog_categories_id_seq', 1, false)|)

1.upto(3).each do |i|
  parent = BlogCategory.create(
    sort_order: i,
    permalink: "permalink#{i}",
    name: "category#{i}",
    level: i
  )
  1.upto(3).each do |j|
    child = BlogCategory.create(
      sort_order: j,
      permalink: "permalink#{i}-#{j}",
      name: "category#{i}-#{j}",
      level: j,
      parent: parent
    )
    1.upto(3).each do |k|
      BlogCategory.create(
        sort_order: k,
        permalink: "permalink#{i}-#{j}-#{k}",
        name: "category#{i}-#{j}-#{k}",
        level: k,
        parent: child
      )
    end
  end
end
