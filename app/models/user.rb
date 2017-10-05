class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
