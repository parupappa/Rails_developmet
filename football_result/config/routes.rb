Rails.application.routes.draw do
  get "posts" , to: "posts#index"
  get 'posts/index'
  get 'posts/new',to: "posts#new"
  post "posts" , to: "posts#create"
  get 'posts/:id', to: "posts#show"
  get 'posts/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
