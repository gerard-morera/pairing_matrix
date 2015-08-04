Rails.application.routes.draw do
  root to: 'pairs#index'
  get '/students', to: 'students#index'
end