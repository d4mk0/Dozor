Rails.application.routes.draw do
  root to: 'sessions#login'
  resources :quests do
    member do
      get :expected
      get :complete
      get :results
    end
    resources :tasks do
      post 'attempt', on: :member
    end
  end

  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
end
