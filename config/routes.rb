Rails.application.routes.draw do
  get 'users/new'
  root to: "static_pages#home"
  get 'help' => 'static_pages#help'
  get 'contact' => 'static_pages#contact'
  get 'about' => 'static_pages#about'
  get 'signup' => 'users#new'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
