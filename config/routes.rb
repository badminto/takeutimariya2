Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index' # ここを追記します
  get 'home/index' # 自動で設定されたルーティング
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end