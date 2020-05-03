Rails.application.routes.draw do
  root 'home#index'
  post 'receive_data', to: "home#receive_data"
end
