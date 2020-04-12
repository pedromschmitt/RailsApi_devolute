Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'user_token' => 'user_token#create'
      resources :users, only: %i[show create update destroy] do
        # 'on: :collectin' remove :id from path
        get 'current', on: :collection
      end
    end
  end
end
