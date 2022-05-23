class Partyer < ApplicationRecord
  belongs_to :user

  validates :gender, presence: true
  validates :name, presence: true
  validates :birth_date, presence: true

  validate :user_adult_age?

  def user_adult_age?
    errors.add(:user, 'deve ser maior de idade') if self.birth_date >= 18.years.ago
  end
end
