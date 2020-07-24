class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies, id: :uuid do |t|
      t.references :user, null: false, index: true, type: :uuid
      t.string :title
      t.text :description
      t.string :url
      t.boolean :published

      t.timestamps
    end
  end
end
