class PartyPlace < ApplicationRecord
  require "cpf_cnpj"

  belongs_to :user
  has_one :address
  has_one :party_feature

  has_many :checkins, dependent: :destroy

  validates :name, presence: true
  validates :cnpj, presence: true, uniqueness: true
  validates :main_contact, presence: true
  validates :cellphone, presence: true

  before_validation :validate_cnpj

  def delete_associated_data
    self.user.destroy! if self.user
    self.address.destroy! if self.address
    self.party_feature.destroy! if self.party_feature
  end

  private
  def validate_cnpj
    if self.cnpj?
      errors.add(:party_place, 'CNPJ deve ser válido') unless CNPJ.valid?(self.cnpj, strict: true)
    end
  end
end
