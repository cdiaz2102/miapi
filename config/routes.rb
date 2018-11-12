Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :users
  namespace 'api' do
    namespace 'v1' do
      resources :articles
    end
  end

  post 'user_token' => 'user_token#create'
  get 'users/current' => 'users#current'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
