Rails.application.routes.draw do


  devise_for :users, :path_names => {sign_in: 'login', sign_out: 'logout', sign_up: 'register'},
             :controllers => {registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks'}


  root 'home#index', :as => :home

  get 'bio', :to => 'bio#bio', :as => :bio
  get 'tracks', :to => 'music#tracks', :as => :tracks
  get 'video', :to => 'music#video', :as => :video
  get 'pics', :to => 'photos#pics', :as => :pics
  get 'art', :to => 'photos#art', :as => :art
  get 'follow', :to => 'follow#follow', :as => :follow
  get 'contact', :to => 'follow#contact', :as => :contact


  match ':controller(/:action(/:id))', :via => [:get, :post]


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#pics'

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
