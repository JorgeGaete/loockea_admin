LoockeaAdmin::Application.routes.draw do

  resources :admins
  resources :sessions, only: [:new, :create, :destroy]

  root  'admin_navegation#home'
  
  match '/help',      to: 'admin_navegation#help',      via: 'get'
  match '/campanas',  to: 'admin_navegation#campanas',  via: 'get'
  match '/contenidos',to: 'admin_navegation#contenidos',via: 'get'
  match '/perfiles',  to: 'admin_navegation#perfiles',  via: 'get'
  
  match '/signup',    to: 'admins#new',                 via: 'get'
  match '/signin',    to: 'sessions#new',               via: 'get'
  match '/signout',   to: 'sessions#destroy',           via: 'delete'
  
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
