class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :language, null: false, default: "en"
      t.references :user, null: false, foreign_key: true
      t.string :time_zone, null: false, default: "Moscow"

      t.timestamps
    end
  end
end
