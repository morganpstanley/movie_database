class Actor < ApplicationRecord
    belongs_to :movie
    validates :name, :movie_id, presence: true

end
