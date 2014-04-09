Blogify::Application.routes.draw do
  


  mount Ckeditor::Engine => '/ckeditor'
  get "post_types/new", to:"post_types#new"
  post "post_types/create", to:"post_types#create", as:"create_post_type"
  get "tags/new", to:"tags#new"
  post "tags/create", to:"tags#create", as:"create_tag"
  get "tags/:slug", to:"posts#by_tag", as:"by_tag"
  get "categories/new", to:"categories#new"
  post "categories/create", to:"categories#create", as:"create_category"
  get "categories/:slug", to:"posts#by_category", as:"by_category"

  post "comments/create", to:"comments#create"

  resources :categories
  resources :posts
  resources :tags
  root 'posts#home'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
