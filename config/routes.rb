Rails.application.routes.draw do
  root to: 'pairs#index'
  resources :students do
    resources :partners
    resources :blacklist, :only => [:index, :new, :create, :show]
  end
end
