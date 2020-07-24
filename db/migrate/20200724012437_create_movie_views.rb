class CreateMovieViews < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_views, id: :uuid do |t|
      t.references :movie, null: false, index: true, type: :uuid
      t.string :browser

      t.timestamps
    end
  end
end
