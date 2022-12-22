Rails.application.routes.draw do
  namespace :users do
    get 'articles/new'
  end
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index' # ここを追記します
  get 'home/index' # 自動で設定されたルーティング
  namespace :users do
  resource :dash_boards, only: :show, as: :root
  resources :articles
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
end