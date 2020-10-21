class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze

  has_secure_password

  validates :email,
    presence: true,
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :password,
    presence: true,
    length: { minimum: 6, maximum: 255 },
    format: { with: VALID_PASSWORD_REGEX },
    allow_nil: true
end
