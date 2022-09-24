if @party_places.respond_to?('each')
  json.array! @party_places do |party_place|
    json.partial! "party_places/self", party_place: party_place
    json.address party_place.address
    json.party_features party_place.party_feature
  end
else
  json.partial! "party_places/self", party_place: @party_places
  json.address @party_places.address
  json.party_features @party_places.party_feature
end