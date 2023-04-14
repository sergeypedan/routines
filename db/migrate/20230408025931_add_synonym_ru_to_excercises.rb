class AddSynonymRuToExcercises < ActiveRecord::Migration[6.1]
  def change
    add_column :excercises, :synonym_en, :string
    add_column :excercises, :synonym_ru, :string
  end
end
