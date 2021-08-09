Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login' => 'user_sessions#new'
  post '/login' => 'user_sessions#create'
  post '/logout' => 'user_sessions#destroy'

  get "/" => "users#index"
  get "/users/new" => "users#new"
  post "/users/create" => "users#create"
  get "/users/:id/show" => "users#show"

  root "user#index"
end
