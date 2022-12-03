Rails.application.routes.draw do

  namespace :public do
    get 'members/show'
    get 'members/edit'
    get 'members/unsubscribe'
  end
  namespace :public do
    get 'targets/new'
    get 'targets/index'
    get 'targets/show'
    get 'targets/edit'
  end
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

# 顧客用
# URL /members/sign_in ...
devise_for :members, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
