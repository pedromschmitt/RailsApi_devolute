Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'user_token' => 'user_token#create'
      get 'users/create'
      get 'users/destroy'
      get 'users/update'
      get 'users/current'
      get 'users/show'
    end
  end
end
