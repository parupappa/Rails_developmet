Rails.application.routes.draw do
=begin
   get 'posts' => 'posts#index'
   get 'posts/new' => 'posts#new'
   post 'posts' => 'posts#create'
   get 'posts/:id' => 'posts#show'
   get 'posts/:id/edit' => 'posts#edit'
   put 'posts/:id' => 'posts#update'
   delete 'posts/:id' => 'posts#destroy'
=end


   resources :posts do
     resources :comments, only: [:create, :destroy]
   end
end
