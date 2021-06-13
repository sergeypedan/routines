class AddNameEnToMuscle < ActiveRecord::Migration[6.0]
  def change
    add_column :muscles, :name_en, :string
  end
end
