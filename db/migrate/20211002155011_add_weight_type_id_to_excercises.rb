class AddWeightTypeIdToExcercises < ActiveRecord::Migration[6.1]
  def change
    add_reference :excercises, :weight_type, foreign_key: { to_table: :excercise_weight_types }
  end
end
