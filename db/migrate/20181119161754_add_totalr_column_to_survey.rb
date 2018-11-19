class AddTotalrColumnToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :totalr, :decimal, precision: 20, scale: 10, default: 0
  end
end
