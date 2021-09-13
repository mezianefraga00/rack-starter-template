class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.integer :rating
      t.belongs_to :director, foreign_key: true
      
    end
  end
end
