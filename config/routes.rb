Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'users/:id/posts' => 'users#posts', :as => :user_posts
  post 'authenticate', to: 'authentication#authenticate'
  concern :commentable do
    resources :comments, only: [:index]
  end

  concern :post_commentable do
    resources :posts, only: %i[index show create update destroy], concerns: :commentable
  end

  concern :user_postable do
    resources :users, only: %i[index show], concerns: :post_commentable
  end

  resources :books, only: %i[index show create update destroy], concerns: :user_postable
  resources :movies, only: %i[index show create update destroy], concerns: %i[user_postable post_commentable]

  resources :users, only: %i[index show create update destroy] do
    resources :posts, only: [:index]
  end

  resources :posts, only: %i[index show create update destroy] do
    resources :comments, only: %i[index show create update destroy]
  end
end
