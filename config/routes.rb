Rails.application.routes.draw do
  authenticated :user do
    root :to => "tasks#index"
  end

  root 'tasks#top'

  get "/about" => "tasks#about", as: "about"

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'}

  resources :tasks, only: [:index, :new, :create, :edit, :update, :change, :complete_tasks] do
    member do
      patch "/complete" => "tasks#change", as: "change"
      delete "/" => "tasks#destroy", as: "delete"
    end

    collection do
      get "/complete" => "tasks#complete", as: "complete"
      patch "/complete_all" => "tasks#change_all", as: "change_all"
      delete "/" => "tasks#destroy_all", as: "delete_all"
    end
  end

  resources :users, only: [:edit, :update, :index, :show] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'users#followings', as: 'followings'
    get 'followers' => 'users#followers', as: 'followers'

    collection do
      get 'ranking' => 'users#ranking', as: 'ranking'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
