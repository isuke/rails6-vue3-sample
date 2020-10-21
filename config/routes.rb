Rails.application.routes.draw do
  root 'pages#home'

  get    '/home'   , to: 'pages#home'
  get    '/signup' , to: 'pages#signup'
  get    '/login'  , to: 'pages#login'
  get    '/mypage' , to: 'pages#mypage'

  namespace :api do
    get    '/login'  , to: 'sessions#create'
    post   '/login'  , to: 'sessions#create'
    delete '/logout' , to: 'sessions#destroy'

    resources :users, only: %i[show create]
  end
end
