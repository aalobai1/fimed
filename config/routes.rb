Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :patients, only: %i[index show update destroy] do
    resources :treatments
  end
end
