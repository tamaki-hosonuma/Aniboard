Rails.application.routes.draw do
  get 'home/show'
  #get 'users/show'
  #devise_for :users, controllers: {
    #sessions: 'users/sessions'
  #}
  devise_for :users, controllers: { registrations: 'users/registrations',
  sessions: 'users/sessions',
  passwords: 'users/passwords' }
  get "users/show" => "users#show"
  resources :users
  root 'home#show'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
