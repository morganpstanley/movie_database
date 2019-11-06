class Movie < ApplicationRecord
    has_many :user_movies
    has_many :users, through: :user_movies

    validates :name, :director, :genre, presence: true

    def avg_rating
        movie_owners = UserMovie.select{ |m| m.movie_id == self.id}
        if movie_owners != [] && movie_owners.any?{ |m| m.rating }
            rating_count = 0.0
            movie_owners.each do |m|
                if m.rating
                    rating_count += m.rating
                end
            end
            "#{(rating_count / movie_owners.count).round(2)}/10"
        else
            "Not enough votes"
        end
     end
 

end
