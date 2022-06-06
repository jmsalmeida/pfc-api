class Address < ApplicationRecord
  belongs_to :party_place

  validates :street, presence: true
  validates :city, presence: true
  validates :place_number, presence: true
  validates :postal_code, presence: true
  validates :district, presence: true
end
