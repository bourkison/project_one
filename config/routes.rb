# == Route Map
#
#         Prefix Verb   URI Pattern                    Controller#Action
#           root GET    /                              pages#home
#          users GET    /users(.:format)               users#index
#                POST   /users(.:format)               users#create
#       new_user GET    /users/new(.:format)           users#new
#      edit_user GET    /users/:id/edit(.:format)      users#edit
#           user GET    /users/:id(.:format)           users#show
#                PATCH  /users/:id(.:format)           users#update
#                PUT    /users/:id(.:format)           users#update
#                DELETE /users/:id(.:format)           users#destroy
#          posts GET    /posts(.:format)               posts#index
#                POST   /posts(.:format)               posts#create
#       new_post GET    /posts/new(.:format)           posts#new
#      edit_post GET    /posts/:id/edit(.:format)      posts#edit
#           post GET    /posts/:id(.:format)           posts#show
#                PATCH  /posts/:id(.:format)           posts#update
#                PUT    /posts/:id(.:format)           posts#update
#                DELETE /posts/:id(.:format)           posts#destroy
#       comments GET    /comments(.:format)            comments#index
#                POST   /comments(.:format)            comments#create
#    new_comment GET    /comments/new(.:format)        comments#new
#   edit_comment GET    /comments/:id/edit(.:format)   comments#edit
#        comment GET    /comments/:id(.:format)        comments#show
#                PATCH  /comments/:id(.:format)        comments#update
#                PUT    /comments/:id(.:format)        comments#update
#                DELETE /comments/:id(.:format)        comments#destroy
# following_user GET    /users/:id/following(.:format) users#following
# followers_user GET    /users/:id/followers(.:format) users#followers
#                GET    /users(.:format)               users#index
#                POST   /users(.:format)               users#create
#                GET    /users/new(.:format)           users#new
#                GET    /users/:id/edit(.:format)      users#edit
#                GET    /users/:id(.:format)           users#show
#                PATCH  /users/:id(.:format)           users#update
#                PUT    /users/:id(.:format)           users#update
#                DELETE /users/:id(.:format)           users#destroy
#          login GET    /login(.:format)               session#new
#                POST   /login(.:format)               session#create
#                DELETE /login(.:format)               session#destroy
# 

Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users
  resources :posts
  resources :comments

  resources :users do
    member do
      get :following, :followers
    end
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
