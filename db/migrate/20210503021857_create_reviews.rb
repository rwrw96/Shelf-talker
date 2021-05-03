class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.string :movie_title
      t.string :release_date
      t.text :overview
      t.text :poster_path
      t.integer :tmdb
      t.float :rate
      t.integer :user_id
      t.timestamps
    end
  end
end
