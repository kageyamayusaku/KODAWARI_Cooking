Rails.application.routes.draw do

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

# ユーザー用
# URL /user/sign_in ...
devise_for :user,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

  scope module: :user do
    root to: "homes#top"
    resources :recipes
    resources :post_comments
    resources :favorites
    resources :genres
    resources :tags
  end

 get 'admins/top' => 'admins#top'

end
