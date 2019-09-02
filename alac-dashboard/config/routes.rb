Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :actors
    root to: "main#index"
    # get '/' => 'main#index'
    get '/reports/:id' => 'main#show'
  end

  devise_for :users
  root 'main#index'

  # namespace :admin, defaults: { format: 'html' } do
  #   get '/' => 'main#index'
  #   get '/reports/:id' => 'main#show'
  # end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
