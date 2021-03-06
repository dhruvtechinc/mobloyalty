Mobloyalty::Application.routes.draw do
  

  #resources :vendor_programs

  get "rewards/new"
  get "rewards/create"
  get "rewards/show"
  get "membership/new"
  get "membership/show"
  get "store_searches/new"
  get "businesses/new"
  get "/vendor_program_setups(/:id)" => "vendor_program_setups#test"
  
  

  #post "membership/add"
  #require File.expand_path("../../lib/logged_in_constraint", __FILE__)
  resources :users
  resources :businesses
  resources :sessions, only: [:new, :create, :destroy]
  resources :stores
  resources :store_searches
  resources :membership
  resources :rewards
  resources :widgets
  resources :qrcodes
  resources :password_resets
  resources :vendor_program_setups
  root "static_pages#home" #, constraints: LoggedInConstraint.new(false)
  #root to: "users#new", constraints: LoggedInConstraint.new(true)
  #root  'users#new'
  
  match '/signup',  to: 'users#new',              via: 'get'
  #match '/signup',  to: 'stores#signup',              via: 'get'
  match '/signin',  to: 'sessions#new',           via: 'get'
  match '/signout', to: 'sessions#destroy',       via: 'delete'
  match '/signout', to: 'sessions#destroy',       via: 'get'
  match '/help',    to: 'static_pages#help',      via: 'get'
  match '/about',   to: 'static_pages#about',     via: 'get'
  match '/contact', to: 'static_pages#contact',   via: 'get'
  match '/membership/add', to: 'store_searches#add', via: 'post'
  match '/widgets', to: 'widgets#show', via: 'get', :format => :js
  #match '/stores/signup', to: 'stores#signup', via: 'get', as: :signup


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
