Rails.application.routes.draw do

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  root to: "homes#top"
  resources :members, only: [:index, :show, :update]
  resources :targets, only: [:index, :show, :destroy] do
    # :idが不要な場合
    collection do
      get "search" => "targets#search"
      get "sort_new" => "targets#sort_targets"
      get "sort_old" => "targets#sort_targets"
    end
    resources :tasks, only:[:destroy]
    resources :comments, only:[:destroy]
  end
  resources :tasks, only:[:index, :show]
  get "search" => "tasks#search"
  get "favorites/:id" => "favorites#index", as: "favorites"
  resources :comments, only:[:index, :show]
  get "search_comment" => "comments#search"
end


# 顧客用
# URL /members/sign_in ...
devise_for :members, controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
}

scope module: :public do
  root to: "homes#top"
  get "/about" => "homes#about", as: "about"
  resources :members, only: [:show, :edit, :update] do
    # :idが必要な場合
    member do
      # 退会機能
      get "/unsubscribe" => "members#unsubscribe", as: "confirm_unsubscribe"
      patch "/withdrawal" => "members#withdrawal", as: "withdrawal_member"
    end
  end
  # get "/members/mypage" => "members#show", as: "mypage"
  # # members/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている。
  # get "/members/information/edit" => "members#edit", as: "edit_information"
  # patch "/members/information" => "members#update", as: "update_information"
  # # 退会機能
  # get "/members/unsubscribe" => "members#unsubscribe", as: "confirm_unsubscribe"
  # put "/members/information" => "members#update"
  # patch "/members/withdrawal" => "members#withdrawal", as: "withdrawal_member"
  resources :activities, only: [:index] do
    # :idが不要な場合
    collection do
      get "checked" => "activities#checked"
      put "update_all" => "activities#update_all"
    end
  end
  resources :targets, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
    # :idが不要な場合
    collection do
      get "search" => "targets#search"
      get "sort_new" => "targets#sort_targets"
      get "sort_old" => "targets#sort_targets"
    end
    resource :favorites, only: [:create, :destroy]
    resources :tasks, only: [:create, :edit, :update, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  get "favorites/:id" => "favorites#index", as: "favorites"
end

  # ゲストログイン用
  devise_scope :member do
    post "members/guest_sign_in", to: "public/sessions#guest_sign_in", as: "members_guest_sign_in"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
