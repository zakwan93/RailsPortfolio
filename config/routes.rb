Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :projects, except: [:show] do
    put :sort, on: :collection
  end
  get 'projects/:id', to:'projects#show', as:"project_show"

  get 'react-projects', to:'projects#react'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
  get 'about', to:"pages#about"
  get 'contact', to:"pages#contact"
  root to: "pages#home"
 
end
