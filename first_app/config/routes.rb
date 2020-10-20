Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boards do
    resources :comments, only: [:create, :destroy]
  end

  root to: "boards#index"

  get "boards" => "boards#index"
  get "boards/new" => "boards#new"
  post "boards" => "boards#create"
  get "boards/:id" => "boards#show"
  get "boards/:id/edit" => "boards#edit"
  put "boards/:id" => "boards#update" #put は全部を更新したい時のメソッド
  delete "boards/:id" => "boards#destroy"


end