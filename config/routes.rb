Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/member_details' => 'members#index'
  get '/posts/:id' => 'posts#show'
  get '/posts' => 'posts#index'

  namespace :api do
    namespace :v1 do 
      resources :companies
      resources :posts, only: [:index, :show]
    end
  end
end
