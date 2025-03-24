class CreateStepEquipments < ActiveRecord::Migration[8.0]
  def change
    create_table :step_equipments do |t|
      t.references :step, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
