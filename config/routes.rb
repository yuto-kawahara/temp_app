Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    get    'users/login'  => 'user/sessions#new',        as: :new_user_session
    post   'users/login'  => 'user/sessions#create',     as: :user_session
    delete 'users/logout' => 'user/sessions#destroy',    as: :destory_user_session
    get    'users/signup' => 'user/registrations#new',   as: :new_user_registration
    post   'users/signup' => 'user/registrations#create',as: :user_registration
  end

  root to: 'homes#top'
  get '/home'    => 'homes#home'
  get '/setting' => 'homes#setting'
  get '/help'    => 'homes#help'
  get '/contact' => 'homes#contact'

  resources :users, param: :nickname, only: [:update] do
    member do
      get   '/'             => 'users#show', as: :profile
      get   '/profile_edit' => 'users#edit', as: :profile_edit
      get   'unsubscribe'
      patch 'withdraw'
      get   'followings', 'followers'
    end
    resource :relationships, only: [:create, :destroy]
  end

  resources :recruits, param: :title do
    collection do
      get  'schedule'
    end
    member do
      post 'confirm'
      get  'complete'
    end
    resources :recruit_comments, only: [:edit, :update, :create, :destory]
  end

  resources :reserves, only: [:update, :create, :destroy]
  resources :notifications, only: [:index]
  resources :messages, only: [:create, :destory, :index, :show]

end