class AddMovieIdToActor < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :movie_id, :integer
  end
end
