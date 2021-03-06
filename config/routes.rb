Rails.application.routes.draw do

  #project root
  root to: 'products#index'
  
  #routes for user, user orders, and address update
  resources :users do
    resources :orders, only: [:index, :show]
    member do
      get :address, :payment
      patch :update_address
      put :update_address
    end
  end
  
  #routes for account activiation
  resources :account_activations, only: [:edit]
  
  #routes for password reset
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  #routes for products
  resources :products
  
  #route for cart & confirm address
  resource :cart do
    member do
      get :confirm_address, :confirm_payment
    end
  end
  
  #routes for order items
  resources :order_items
  
  #routes for cart items
  resources :cart_items
  
  #routes for orders
  resources :orders
  
  #routes for login, logout
  match '/signup',  to: 'users#new',    via: 'get'
  match '/login',   to: 'sessions#create', via: 'post'
  match '/login',   to: 'sessions#new',    via: 'get'
  match '/logout',  to: 'sessions#destroy', via: :delete
  
  #routes for password reset
  get 'password_resets/new'
  get 'password_resets/edit'
  
  #routes for static pages
  get 'static_pages/home'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'

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
