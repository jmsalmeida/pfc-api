class ApiClient
  field :name, type: String
  field :token, type: String
  field :domain_service, type: Boolean, default: false

  belongs_to :user, optional: true

  validates :name, presence: true, uniqueness: true
  validates :token, presence: true, uniqueness: true
  validates :user_id, presence: true, if: :domain_service?

  before_validation :generate_token

  def generate_token
    unless token
      self.token = loop do
        token = SecureRandom.base64.tr('+/=', 'Qrt')
        break token unless ApiClient.where(token: token).exists?
      end
    end
  end
end