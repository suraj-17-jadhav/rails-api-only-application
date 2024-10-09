Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  resources :users, only: [:create, :show]
  post '/users/:id/assign_user_policy', to: 'users#assign_user_policy'
  post '/users/:id/upload_document', to: 'users#upload_document'
  post '/users/:id/upload_policy_document', to: 'users#upload_policy_document'

end
