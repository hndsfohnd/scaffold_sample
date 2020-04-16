Rails.application.routes.draw do

  root "books#index"
  resources :books do
    member do
      get :check
      post :check, to: "books#check"
    end
  end
  resources :searches do
  collection do
      get :"result"
      post :"result", to:"searchs#result"
    end
  end
  resources :authors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
