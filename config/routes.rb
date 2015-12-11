Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'home#index'

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :users, only: [:index, :show]
    resources :products, only: [:index, :new, :create]
  end


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'products' => 'products#index'
  get 'products/:id' => 'products#show', :constraints => { :id => /[0-9|]+/ }

  get 'users' => 'users#index'
  get 'profile' => 'users#show'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'edit' => 'users#edit'
  post 'edit' => 'users#update'
  get 'changepassword' => 'users#changepassword'

  get 'profile/:id' => 'users#showorder'

  post 'ratings' => 'ratings#create'
  post 'helpfulness' => 'helpfulness#create'

  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout'  => 'session#destroy'
	
	post 'ordersession/orders_add'  => 'ordersession#orders_add'
	post 'ordersession/orders_update'  => 'ordersession#orders_update'
	post 'ordersession/orders_remove'  => 'ordersession#orders_remove'

	get 'cart'  => 'cart#index'

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
