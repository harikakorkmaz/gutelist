Rails.application.routes.draw do

  authenticated :user do
    root :to => "tasks#index"
  end

  root 'tasks#top'

  devise_for :users

  resources :tasks, only: [:index, :new, :create, :edit, :update, :change, :complete_tasks] do
    member do
      delete "/" => "tasks#destroy"
      patch "/complete" => "tasks#change", as: "change"
    end

    collection do
      get "/complete" => "tasks#complete"
    end
  end

  resources :users, only: [:edit, :update, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

