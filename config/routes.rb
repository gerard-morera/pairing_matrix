Rails.application.routes.draw do
  root to: 'pairs#index'
  resources :students do
    resources :partners
  end

end
