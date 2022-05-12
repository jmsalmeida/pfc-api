Rails.application.routes.draw do
  resources :api_keys, path: 'api-keys', only: %i[index create destroy]
  resources :messages, path: 'messages', only: %i[index]
end
