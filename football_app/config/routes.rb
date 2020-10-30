Rails.application.routes.draw do
  get 'people', to: "people#index"
  get 'people/add', to: "people#add"
  post "people/add", to:"people#create"

  get 'people/edit/:id', to: "people#edit"
  patch "people/edit/:id", to: "people#update" #データ更新は patch
  get "people/delete/:id", to: "people#delete" 
  get 'people/:id', to:"people#show"
end
