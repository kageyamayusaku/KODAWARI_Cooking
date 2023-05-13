Rails.application.routes.draw do

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

# ユーザー用
devise_for :user,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

  scope module: :admin do
    resources :tags, only: [:index, :destroy]
  end

  scope module: :user do
    root to: "homes#top"
    get 'home' => 'homes#home'
    post 'homes/guest_log_in' => 'homes#guest_log_in'
    resources :recipes do
      resources :tags, only: [:create]
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
  end

end
