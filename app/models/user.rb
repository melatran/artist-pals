class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest, require: true

  has_secure_password

  before_create :create_api_key

  def create_api_key
    self.api_key = SecureRandom.uuid
  end
end