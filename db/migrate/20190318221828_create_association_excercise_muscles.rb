class CreateAssociationExcerciseMuscles < ActiveRecord::Migration[5.2]
  def change
    create_table :association_excercise_muscles do |t|
      t.references :excercise, foreign_key: true
      t.references :muscle, foreign_key: true

      t.timestamps
    end
  end
end
