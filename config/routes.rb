Rails.application.routes.draw do
  root 'conditions#index'
  resources :conditions
end
