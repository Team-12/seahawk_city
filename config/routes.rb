Rails.application.routes.draw do

  root 'site#index'
  get 'about' => 'site#about'

  # sessions
  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy', as: :logout

  # users
  get 'signup' => 'users#new', as: :signup
  post 'signup' => 'users#create'
  get 'profile' => 'users#profile', as: :profile
  get 'edit/profile' => 'users#edit_profile', as: :edit_profile
  patch 'profile' => 'users#update_profile', as: :update_profile

  # events
  get 'events/new/:locationid' => 'events#new', as: :new_event
  get 'events/nearby/:latitude/:longitude' => 'events#nearby', as: :nearby_events
  resources :events, only: [:index, :show, :create, :edit, :destroy, :update]

  # locations
  get 'locations/nearby/:latitude/:longitude' => 'locations#nearby', as: :nearby_locations
  resources :locations

  # checkins
  resources :checkins

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
