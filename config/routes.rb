Rails.application.routes.draw do
  resources :party_places, path: 'party-places', only: %i[index show]

  namespace :auth do
    post "signin", to: "sessions#create"
    delete "signout", to: "sessions#destroy"

    post "signup/partyer", to: "register_partyers#create"
    post "signup/party-place", to: "register_party_places#create"
    delete "destroy", to: "registrations#destroy"
  end
end
