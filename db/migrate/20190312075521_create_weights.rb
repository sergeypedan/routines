class CreateWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :weights do |t|
      t.string :name, null: false
      t.integer :mass, null: false, default: 5000
      t.string :type, null: false, default: "Блин"

      t.timestamps
    end
  end
end
