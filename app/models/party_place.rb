class PartyPlace < ApplicationRecord
  require "cpf_cnpj"

  belongs_to :user
  has_one :address

  validates :name, presence: true
  validates :cnpj, presence: true
  validates :main_contact, presence: true
  validates :cellphone, presence: true

  before_validation :validate_cnpj

  private
  def validate_cnpj
    if self.cnpj?
      errors.add(:party_place, 'CNPJ deve ser válido') unless CNPJ.valid?(self.cnpj, strict: true)
    end
  end
end
