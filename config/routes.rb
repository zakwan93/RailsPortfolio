Rails.application.routes.draw do
  resources :projects, except: [:show]
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
