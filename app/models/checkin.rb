class Checkin < ApplicationRecord
  belongs_to :partyer
  belongs_to :party_place
end
