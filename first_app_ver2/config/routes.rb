Rails.application.routes.draw do
  get "boards" ,to: "boards#index"
  get "boards/new" ,to: "boards#new"
  post "boards" , to: "boards#create"
  get "boards/:id" , to: "boards#show"
  get "boards/:id/edit", to: "boards#edit"
  put "boards/update",to: "boardss#update"
  delete "boards/:id" , to: "boards#destroy"

  #rails で定義されている七つのアクションのルーティングを自動で書いてくれる
  #REST : ユーザーが自分の好き勝手に機能を追加していくのではなく、あらかじめ決められたリソースを定義し、それに沿ってアクションとhttpメソッドを関連づけるという考え方です。
  #これを定義することによってヘルパーが使えるようになる
  resources :boards do
    resources :comments, only: [:create, :destroy]
  end

  root to: "boards#index"

end
