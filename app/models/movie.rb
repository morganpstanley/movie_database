class Movie < ApplicationRecord
    has_many :user_movies
    has_many :users, through: :user_movies

    validates :name, :director, :genre, presence: true

end
