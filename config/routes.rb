Rails.application.routes.draw do
  resources :recipes do
    post 'fetch_data', to: 'recipes#fetch_data'
    get 'fetch_data', to: 'recipes#fetch_data'
  end
  root 'recipes#index'
end
 