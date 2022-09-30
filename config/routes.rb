Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  resource :retirements, only: %i[new create]
  resources :events, only: %i[new create show editt update destroy] do
    resources :tickets, only: %i[new create destroy]
  end

  get 'status', to: 'status#index', defaults: { format: 'json' }

  match "*path" => "application#error404", via: :all
end
