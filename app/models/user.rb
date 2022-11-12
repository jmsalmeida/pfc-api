class User < ApplicationRecord
  has_many :api_keys, as: :bearer
  has_many :sessions, dependent: :destroy

  has_secure_password
  validates :user_type, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/, message: I18n.t("errors.models.user.format_email") }

  before_save :downcase_email
  before_create :generate_confirmation_token
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

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save! validate: false
  end

  def generate_confirmation_token
    self.confirm_token = SecureRandom.random_number(999999)
  end

  private
  def downcase_email
    self.email = self.email.downcase
  end
end
