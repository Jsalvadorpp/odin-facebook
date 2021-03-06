Rails.application.routes.draw do
  devise_for :users , controllers: { omniauth_callbacks: 'users/omniauth_callbacks' ,
                                      registrations: 'users/profile'}
                                    
  get '/user/profile/:id' => 'user#show' , as: 'user_profile'
  get '/notifications' => 'notifications#show' , as: 'user_notifications'
  post '/friendship_request' => 'notifications#create' , as: 'friendship_request'
  delete '/remove_request' => 'notifications#destroy' , as: 'remove_request'
  get '/user/profile/:id/friends' => 'user#friends_list' , as: 'friends_list'
  get '/users' => 'user#search' , as: 'users_list'
 
  resources :posts , only: [:new, :create]
  post 'add_like' => 'posts#add_like' , as: 'like_post'
  delete 'remove_like' => 'posts#remove_like' , as: 'remove_like'
  post 'new_comment' => 'comments#new' , as: 'new_comment'

  resources :friendships , only: [:create,:destroy]
  #devise_scope :user do
    #get '/users/sign_out' => 'devise/sessions#destroy'
  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home' , as: 'home'
end
