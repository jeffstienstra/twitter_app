Rails.application.routes.draw do
  get "/tweets" => "tweets#index"
  post "/tweets" => "tweets#create"
  get "/tweets/:id" => "tweets#show"
  patch "/tweets/:id" => "tweets#update"
  delete "/tweets/:id" => "tweets#destroy"

  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"
end
