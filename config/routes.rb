Rails.application.routes.draw do
  root to: 'pairs#index'
  resources :students do
    resources :partners
    resources :blacklist, :only => [:new]
  end
end
