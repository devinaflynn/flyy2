Rails.application.routes.draw do



  get 'topics/get_topic_description' => 'topics#get_topic_description'
  resources :topics
  get 'comments/get_comments_by_app' => 'comments#get_comments_by_app'
  resources :comments

  resources :apps do
    get 'youtube_callback' => 'apps#youtube_callback'
    get "mobile", on: :collection
    get "websites", on: :collection
    get "products", on: :collection
    get "viewed",   on: :collection
    get "popular",  on: :collection
  end

  namespace :profile do
    resource :user, only: [:show, :edit, :update]
  end

  resources :upvotes, only: [:create]

  devise_for :users
  root 'pages#index2'

  get '2' => 'pages#index2'
  get 'story' => 'pages#story'
  get 'show' => 'pages#show'
  get 'upload' => 'pages#upload'
  get 'box' => 'pages#box'
  get 'learning' => 'pages#learning'
  get 'startup_blog' => 'pages#startup_blog'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of    resource :user, only: [:show]your site routed with "root"
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
