class JsonWebToken
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  def self.encode(payload)
    payload[:exp] = (Time.now + 1.day).to_i
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    decoded_token = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new decoded_token
  end
end
