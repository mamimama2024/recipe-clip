Rails.application.routes.draw do
  resources :recipes do
    get '/fetch_recipe_info', to: 'recipes#fetch_info'
  end
  root 'recipes#index'
end
 