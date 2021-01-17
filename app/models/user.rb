class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, on: :create
  validates :password_digest, presence: true
  
  has_many :invoices

  has_secure_password

  before_create :set_api_key

  def set_api_key
    self.api_key = SecureRandom.uuid
  end
end