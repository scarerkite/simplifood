class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.integer :time_in_minutes
      t.integer :portions
      t.integer :complexity_rating
      t.jsonb :metadata

      t.timestamps
    end

    add_index :recipes, :metadata, using: :gin
  end
end
