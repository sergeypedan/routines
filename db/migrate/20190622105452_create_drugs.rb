class CreateDrugs < ActiveRecord::Migration[5.2]
  def change
    create_table :drugs do |t|
      t.string :form, null: false, default: "tablet"
      t.string :name, null: false
      # active_substance_id

      t.timestamps
    end
  end
end
