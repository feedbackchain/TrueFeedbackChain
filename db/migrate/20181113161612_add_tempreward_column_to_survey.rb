class AddTemprewardColumnToSurvey < ActiveRecord::Migration[5.2]
  def change
  	add_column :surveys, :tempreward, :decimal, precision: 20, scale: 10, default: 0
  	add_column :surveys, :reward, :decimal, precision: 20, scale: 10, default: 0
  end
end
