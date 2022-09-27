class Partyer < ApplicationRecord
  belongs_to :user
  has_many :checkins

  validates :gender, presence: true
  validates :name, presence: true
  validates :birth_date, presence: true

  before_validation :partyer_is_adult

  def partyer_is_adult
    if self.birth_date
      errors.add(:partyer, 'deve ser maior de idade') if self.birth_date >= 18.years.ago
    end
  end
end
