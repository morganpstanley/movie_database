class User < ApplicationRecord
    has_many :user_movies
    has_many :movies, through: :user_movies

    validates :username, :password, :password_confirmation, :email, presence: true

    has_secure_password

    def self.find_or_create_by_omniauth(auth_hash)
        user = User.where(email: auth_hash['info']['email']).first_or_create do |u|
            u.username = auth_hash['info']['nickname']
            u.password = SecureRandom.hex
            u.password_confirmation = u.password
        end
    end
    
end
