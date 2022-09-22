class PartyFeature < ApplicationRecord
  belongs_to :party_place

  acts_as_taggable_on :drink_types, :food_types, :music_styles, :party_types
end
