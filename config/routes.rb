Rails.application.routes.draw do
  root 'pages#home'
  get 'about' => "pages#about"
  resources :articles
  get 'signup' => 'user#new'
  resources :users, except:[:new]
end
