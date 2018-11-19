class AddPlimitColumnToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :plimit, :integer, default: 100
  end
end
