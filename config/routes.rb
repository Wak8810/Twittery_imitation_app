Rails.application.routes.draw do
  root "microposts#index"  # ルートページを microposts#index に設定
  resources :microposts
end
