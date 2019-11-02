class User < ApplicationRecord
    has_many :user_movies
    has_many :movies, through: :user_movies

    validates :username, :password, :password_confirmation, :email, presence: true

    has_secure_password
    
end
