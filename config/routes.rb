# == Route Map
#
#                   Prefix Verb   URI Pattern                               Controller#Action
#                     root GET    /                                         welcome#index
#            admin_sign_in GET    /admin/sign_in(.:format)                  admin/session#new
#                          POST   /admin/sign_in(.:format)                  admin/session#create
#           admin_sign_out DELETE /admin/sign_out(.:format)                 admin/session#destroy
#               admin_menu GET    /admin/menu(.:format)                     admin/menu#index
#    admin_blog_categories GET    /admin/blog_categories(.:format)          admin/blog_categories#index
#                          POST   /admin/blog_categories(.:format)          admin/blog_categories#create
#  new_admin_blog_category GET    /admin/blog_categories/new(.:format)      admin/blog_categories#new
# edit_admin_blog_category GET    /admin/blog_categories/:id/edit(.:format) admin/blog_categories#edit
#      admin_blog_category GET    /admin/blog_categories/:id(.:format)      admin/blog_categories#show
#                          PATCH  /admin/blog_categories/:id(.:format)      admin/blog_categories#update
#                          PUT    /admin/blog_categories/:id(.:format)      admin/blog_categories#update
#                          DELETE /admin/blog_categories/:id(.:format)      admin/blog_categories#destroy
#              admin_blogs GET    /admin/blogs(.:format)                    admin/blogs#index
#                          POST   /admin/blogs(.:format)                    admin/blogs#create
#           new_admin_blog GET    /admin/blogs/new(.:format)                admin/blogs#new
#          edit_admin_blog GET    /admin/blogs/:id/edit(.:format)           admin/blogs#edit
#               admin_blog GET    /admin/blogs/:id(.:format)                admin/blogs#show
#                          PATCH  /admin/blogs/:id(.:format)                admin/blogs#update
#                          PUT    /admin/blogs/:id(.:format)                admin/blogs#update
#                          DELETE /admin/blogs/:id(.:format)                admin/blogs#destroy
#                    admin GET    /admin(.:format)                          admin/menu#index
#

Rails.application.routes.draw do
  root 'welcome#index'

  namespace :admin do
    get 'sign_in' => 'session#new'
    post 'sign_in' => 'session#create'
    delete 'sign_out' => 'session#destroy'
    get 'menu' => 'menu#index'
    resources 'blog_categories'
    resources 'blogs'
  end

  scope module: :admin do
    get 'admin' => 'menu#index'
  end

  resources 'blogs', only: %i(index show)
end
