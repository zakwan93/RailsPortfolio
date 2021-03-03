Rails.application.routes.draw do
  resources :projects, except: [:show]
  get 'projects/:id', to:'projects#show', as:"project_show"

  resources :blogs
  
  get 'about', to:"pages#about"
  get 'contact', to:"pages#contact"
  root to: "pages#home"
 
end
