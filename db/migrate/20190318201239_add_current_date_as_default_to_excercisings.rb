class AddCurrentDateAsDefaultToExcercisings < ActiveRecord::Migration[5.2]
  def change
  	# change_column_default :excercisings, :date, from: nil, to: { expr: "('now'::text)::date" }
  	# change_column_default :excercisings, :date, from: nil, to: -> { 'NOW()' }
  	# https://github.com/rails/rails/pull/20005
  	execute 'ALTER TABLE excercisings ALTER COLUMN date SET DEFAULT CURRENT_DATE'
  end
end
