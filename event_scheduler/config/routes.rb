Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'welcome#index',as: :home
  get '/signup' => 'welcome#index',as: :user_new
  post 'users' => 'users#create',as: :user_create

  get '/login' => 'welcome#index'
  post '/login' => 'sessions#create',as: :user_session
  get '/logout' => 'sessions#destroy',as: :session_destroy

  get 'user/:id' => 'events#new',as: :user_events_new
  # post 'user/:id/event' => 'events#create',as: :events_create
  get 'event/show' => 'events#show',as: :user_events_show
  get 'event/' => 'events#form',as: :event_form
  post 'event' => 'events#create',as: :event_create_form
  # get 'user/:id/event/:id/invitee' => 'invitations#new',as: :invitee_new
  # post 'user/:id/event/:id/invitee' => 'invitations#create',as: :invitee_create
  get 'event/:id/edit' => 'events#edit',as: :events_edit
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
