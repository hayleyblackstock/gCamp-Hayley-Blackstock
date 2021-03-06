Rails.application.routes.draw do

  root 'welcome#index'

  resources :tasks
  resources :users

  resources :users
    resources :projects do
      resources :tasks do
        resources :comments
      end
    end

    resources :projects do
      resources :memberships
  end

  get '/signup' => 'registrations#new', as: :signup
  post '/signup' => 'registrations#create'
  get '/signin' => 'authentications#new'
  post '/signin' => 'authentications#create'
  get '/signout' => 'authentications#destroy'

get '/' => 'welcome#index'

get '/faq' => 'common_questions#index'

get '/about' => 'about#index'

get '/terms' => 'terms#index'

get '/tasks' => 'tasks#index'




end
