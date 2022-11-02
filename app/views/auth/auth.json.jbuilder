json.Authorization @token
json.user do
  json.partial! "users/self", user: @user

  if @party_place || @partyer
    if @user.user_type == 'party_place'
      json.party_place do
        json.partial! "party_places/self", party_place: @party_place
        json.address @party_place.address
        json.features_is_completed @party_place.party_feature.completed
      end
    else
      json.partyer @partyer
    end
  end
end
