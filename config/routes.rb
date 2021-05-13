Rails.application.routes.draw do
  devise_for :users
  root 'companies#index', as: 'home'
  get '/companies', to: 'companies#index'
  post '/companies/load_xls', to: 'companies#load_xls'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
