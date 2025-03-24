class CreateSteps < ActiveRecord::Migration[8.0]
  def change
    create_table :steps do |t|
      t.references :recipe, null: false, foreign_key: true
      t.text :instruction
      t.integer :order
      t.integer :time_in_minutes
      t.boolean :optional

      t.timestamps
    end
  end
end
