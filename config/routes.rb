Rails.application.routes.draw do
  root 'home#show'

  devise_for :users, controllers: { registrations: 'users/registrations',
  sessions: 'users/sessions',
  passwords: 'users/passwords' }
  get "users/show" => "users#show"

  resources :users 

  resources :animes do
    collection do
      get 'animes/search'=> 'animes#search'
    end
    resources :posts
  end
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
