Rails.application.routes.draw do  

  
  


  get 'transaction/checkout'

  root 'static_pages#home'

  get  '/getstarted',    to: 'static_pages#getstarted'
   get  '/pricing',    to: 'static_pages#pricing'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

   resources :users
   resources :account_activations, only: [:edit]
   resources :password_resets,     only: [:new, :create, :edit, :update]
   resources :projects
   resources :categories
   resources :charges
   resources :payments
   resources :donations


    resources :orders do 
    collection do
      post 'express_checkout'
    end
  end

end
