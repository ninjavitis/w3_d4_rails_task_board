Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "boards#index"
  
resources :boards do
  resources :lists
end

resources :lists do
  resources :tasks, shallow: true
end

end
