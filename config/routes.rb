Rails.application.routes.draw do

  resources :tasks
  resources :users
  resources :projects

  #root 'welcome#index'

get '/' => 'welcome#index'

get '/faq' => 'common_questions#index'

get '/about' => 'about#index'

get '/terms' => 'terms#index'

get '/tasks' => 'tasks#index'




end
