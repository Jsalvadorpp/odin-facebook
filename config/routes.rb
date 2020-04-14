Rails.application.routes.draw do
  devise_for :users , controllers: { omniauth_callbacks: 'users/omniauth_callbacks' ,
                                      registrations: 'users/profile'}
                                    
  get '/user/profile/:id' => 'user#show'
  #devise_scope :user do
    #get '/users/sign_out' => 'devise/sessions#destroy'
  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home' , as: 'home'
end
