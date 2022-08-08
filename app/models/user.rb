class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :role , presence: true, inclusion: { in: %w(admin user), message: "%{value} should be one of these admin, user" }
    validates :password_digest, presence: true
    validates :email, presence: true
end
