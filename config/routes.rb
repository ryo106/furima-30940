Rails.application.routes.draw do
  # get 'items/index'
  # get 'items/new'
  # get 'items/show'
  # get 'items/edit'
  # get 'index/new'
  # get 'index/show'
  # get 'index/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
end
