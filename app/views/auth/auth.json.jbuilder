json.Authorization @token
json.user do
  json.partial! "users/self", user: @user

  if @user.user_type == 'party_place'
    json.party_place do
      json.partial! "party_places/self", party_place: @party_place
      json.address @address
      json.features_is_completed @party_features.completed
    end
  else
    json.partyer @partyer
  end
end
