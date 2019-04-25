class CreateActOfExcersises < ActiveRecord::Migration[5.2]
  def change
    create_table :act_of_excersises do |t|
      t.references :excercise, foreign_key: true
      t.integer :repetitions_count
      t.datetime :datetime

      t.timestamps
    end
  end
end
