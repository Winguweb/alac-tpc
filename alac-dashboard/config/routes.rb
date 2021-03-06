Rails.application.routes.draw do
  
  get 'visualizations/corruption' => 'visualizations#corruption'
  get 'visualizations/age' => 'visualizations#age'
  get 'visualizations/ambit' => 'visualizations#ambit'
  get 'visualizations/sector' => 'visualizations#sector'
  get 'visualizations/location' => 'visualizations#location'
  get 'visualizations/gender' => 'visualizations#gender'
  get 'visualizations/occupation' => 'visualizations#occupation'
  get 'visualizations/rights' => 'visualizations#rights'


  namespace :admin do
    resources :users
    resources :actors
    resources :characterizations
    resources :evolutions
    resources :relationships
    resources :advisories
    resources :tools
    root to: "main#index"
    # get '/' => 'main#index'
    get '/reports/:id' => 'main#show'

    get 'download_data' => 'main#download', via: :get
  end

  namespace :api do 
    get '/indicators/:type' => 'indicators#main', :defaults => { :format => 'json' }
    get '/reports' => 'reports#index', :defaults => { :format => 'json' }
  end
  devise_for :users
  root to: "admin/main#index"

  # namespace :admin, defaults: { format: 'html' } do
  #   get '/' => 'main#index'
  #   get '/reports/:id' => 'main#show'
  # end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
