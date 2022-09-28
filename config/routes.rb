Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  resource :retirements
  resources :events do
    resources :tickets
  end

  get 'status', to: 'status#index', defaults: { format: 'json' }
end
