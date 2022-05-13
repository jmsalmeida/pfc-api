Rails.application.routes.draw do
  resources :api_keys, path: 'api-keys', only: %i[index create destroy]
  resources :partyers, path: 'partyers', only: %i[index create]
end
