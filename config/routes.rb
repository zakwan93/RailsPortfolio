Rails.application.routes.draw do
  resources :projects
  resources :blogs
  
  get 'about', to:"pages#about"
  get 'contact', to:"pages#contact"
  root to: "pages#home"
 
end
