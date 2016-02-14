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
#                    admin GET    /admin(.:format)                          admin/menu#index
#

Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  namespace :admin do
    get 'sign_in' => 'session#new'
    post 'sign_in' => 'session#create'
    delete 'sign_out' => 'session#destroy'
    get 'menu' => 'menu#index'
    resources 'blog_categories'
  end

  scope module: :admin do
    get 'admin' => 'menu#index'
  end
end
