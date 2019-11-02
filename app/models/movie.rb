class Movie < ApplicationRecord
    has_many :user_movies
    has_many :users, through: :user_movies

    validates :name, :director, :genre, presence: true

    def avg_rating
        movies = UserMovie.select{ |m| m.movie_id == self.id}
        rating_count = 0.0
        movies.each do |m|
         rating_count += m.rating
        end
        (rating_count / movies.count).round(2)
     end
 

end
