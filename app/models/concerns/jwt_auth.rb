class JwtAuth
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  def self.generate_token(payload)
    JWT.encode payload, HMAC_SECRET, 'HS256'
  end

  def self.verify_token(token,verify)
    JWT.decode token, HMAC_SECRET, verify, { :algorithm => 'HS256' }
  end

  def self.decode_token(token, verify=true)
    self.verify_token(token,verify).first
  end
end
