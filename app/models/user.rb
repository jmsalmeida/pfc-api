class User < ApplicationRecord
  has_many :api_keys, as: :bearer

  has_secure_password
  validates :user_type, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  before_save :downcase_email
  before_validation :allowed_user_type

  def allowed_user_type
    user_type = self.user_type

    if user_type?
      user_type = user_type.downcase

      unless user_type == 'partyer' || user_type == 'party_place'
        errors.add(:user_type, 'Não permitido')
      end
    end
  end

  private
  def downcase_email
    self.email = self.email.downcase
  end
end
