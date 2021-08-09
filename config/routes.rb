Rails.application.routes.draw do
  root 'home#show'

  devise_for :users, controllers: { registrations: 'users/registrations',
  sessions: 'users/sessions',
  passwords: 'users/passwords' }
  get "users/show" => "users#show"
 
  resources :users do 
    collection do
      get 'show_post' => 'users#show_post'
      get 'like' => 'users#like'
    end
  end

  resources :animes do
    collection do
      get 'animes/search'=> 'animes#search'
    end
    resources :posts do
      get 'post_user' => 'posts#post_user'
    end
  end

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  get 'rakuten_search' => 'rakuten_search#search'
end
