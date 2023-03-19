Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :game_information, only: [:new, :create, :index, :edit, :update]
    resources :teams,            only: [:index, :show, :create, :edit, :update, :destroy]
    resources :players,          only: [:create, :edit, :update, :destroy]
    resources :users,            only: [:index, :show]
    resources :reviews,          only: [:show, :update, :destroy]
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
      resources :reviews do
        resource :favorites, only: [:create, :destroy]
        resources :comments, only:[:create, :destroy]
      end
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    resources :reviews,      only: [:new, :create, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only:[:create, :destroy]
    end
    get 'reviews_all_team' => 'reviews#reviews_all_team', as: 'reviews_all_team'
    get 'reviews_team' => 'reviews#reviews_team', as: 'reviews_team'


  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
