Rails.application.routes.draw do
  root 'pages#home'
  get 'about' => "pages#about"
  resources :articles
  get 'signup' => "users#new"
  resources :users, except:[:new]
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
end
