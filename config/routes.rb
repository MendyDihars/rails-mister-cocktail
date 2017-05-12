Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  resources :cocktails, except: :index do
    resources :doses, only: [:new, :create, :destroy]
  end

  root 'cocktails#index'
end
