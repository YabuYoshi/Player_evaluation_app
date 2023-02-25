Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :teams,          only: [:index, :create, :edit, :update]
    resources :players,        only: [:index, :create, :edit, :update]
    resources :users,          only: [:index]
    resources :reviews,        only: [:show, :update]
    delete 'destroy_evaluation' => 'reviews#destroy_evaluation'
    delete 'destroy_comment' => 'reviews#destroy_comment'
  end


  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    root to: "homes#top"

    resources :users,  only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    resources :reviews,      only: [:new, :create, :show, :edit, :update, :destroy]
    get 'reviews_team' => 'reviews#reviews_team', as: 'reviews_team'
    get 'reviews_user' => 'reviews#reviews_user', as: 'reviews_user' do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only:[:create, :destroy]
    end

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
