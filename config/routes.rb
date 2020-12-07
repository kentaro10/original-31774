Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts
  resources :users, only: :show
  get 'following/:id',to: 'relationships#following', as:'following'
  get 'followerd/:id',to: 'relationships#followerd', as:'followerd'
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  
end
