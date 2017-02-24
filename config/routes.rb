Rails.application.routes.draw do
  # 静的ページ
  root 'static_pages#home'

  # セッション
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  # ユーザ
  resources :users
  # ユーザとマスタデータのリレーション
  # resources :user_dkinds
  resources :user_dkinds, except: [:edit]
  resources :user_dkinds, only: [:edit], param: :user_id
  # 体重などのマスタデータ
  resources :dkinds
  # ユーザごと、日時ごとの記録
  resources :conditions
  # 投稿機能
  resources :articles
end
