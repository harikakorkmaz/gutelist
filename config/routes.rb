Rails.application.routes.draw do
  
  resources :tasks, only: [:index, :new, :create, :edit, :update, :change, :complete_tasks] do
    member do
      delete "/" => "tasks#destroy"
      patch "/" => "tasks#change", as: "change"
    end
    
    collection do 
      get "/complete" => "tasks#complete"
    end
  end
  resources :users, only: [:edit, :update, :index] do
    member do
      get "/" => "users#show"
    end
  end
  
  root 'tasks#top'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
