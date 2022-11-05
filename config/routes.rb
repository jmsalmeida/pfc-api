Rails.application.routes.draw do
  resources :party_places, path: 'party-places', only: %i[index show]
  resources :party_features, path: 'party-features', only: %i[update show]

  namespace :auth do
    post 'signin', to: 'sessions#create'
    delete 'signout', to: 'sessions#destroy'

    post 'signup/partyer', to: 'register_partyers#create'
    post 'signup/party-place', to: 'register_party_places#create'
    delete 'destroy', to: 'registrations#destroy'

    post 'email-confirmation', to: 'auth_actions#confirm_email'
    post 'resend-email-confirmation', to: 'auth_actions#resend_email'
  end

  namespace :checkin do
    resources :visit_parties, path: 'visit-party', only: %i[create]
  end
end
