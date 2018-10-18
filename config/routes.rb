Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogger, only: [:show, :create, :new]
  resources :destination, only: [:show]
  resources :post do
    collection do
      get :like
    end
  end

  post '/post/like', to: "post#like"
end
