class CreateLabs < ActiveRecord::Migration[5.2]
  def change
    create_table :labs do |t|
      t.string :name, null: false
      t.references :city, foreign_key: true, null: false
      t.string :street_address

      t.timestamps
    end
  end
end
