Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
#   root 'welcome#index'

#   # Example of regular route:
#   #   get 'products/:id' => 'catalog#view'
# post '/event' => "events#new", :as => "events"
get "/log_out" => "sessions#destroy", :as => "log_out"
get "/log_in" => "sessions#new", :as => "log_in"
get "/sign_up" => "users#new", :as => "sign_up"
# get "/events" => "events#index", :as => "user"
root 'welcome#index'

 # get 'sign_up' => 'users#new', as: :sign_up



 # get 'login' => 'sessions#new', as: :login_new

 post 'log_in' => 'sessions#create', as: :session_create

 get 'event/new/:user_id' => 'events#new',as: :event_new

 post 'event/new/:user_id' => 'events#create',as: :event_create

 get 'event/list/:user_id' => 'events#index',as: :event_list
 
 get 'event/:id' => 'events#edit', as: :event_edit
 put 'event/:id' => 'events#update', as: :event_update


resources :users
#   resources :events

# resources :sessions, :except => [:new, :destroy]
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
