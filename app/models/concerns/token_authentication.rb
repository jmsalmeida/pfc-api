module TokenAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :check_client_api_token_presence, :authenticate_client_api
  end

  def check_client_api_token_presence
    if api_token.blank?
      errors = [{ id: 'missing_params', title: 'missing_token', code: :bad_request }]
      render json: { errors: errors }, status: :bad_request
    end
  end

  def authenticate_client_api
    @api_client = ApiCliente.where(token: api_token).first
    unless @api_client
      errors = [{ id: 'not_found', title: 'invalid_token', code: :unauthorized }]
      render json: { errors: errors }, status: :unauthorized
    end
  end

  def api_token
    params[:client_token] || request.headers['HTTP_API_KEY']
  end

  def api_client
    @api_client
  end

  def generate_jwt(user, password)
    if user.authenticate(password)
      if user.respond_to? :to_token_payload
        JWT.encode payload, user.to_token_payload
        # Knock::AuthToken.new(payload: user.to_token_payload)
      else
        JWT.encode payload, { sub: user.id }
        # Knock::AuthToken.new(payload: { sub: user.id })
      end
    end
  end
end