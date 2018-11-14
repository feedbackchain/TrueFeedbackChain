class AddDetailsToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :approved, :boolean, default: false
    add_column :surveys, :reviewed, :boolean, default: false
    add_column :surveys, :finished, :boolean, default: false
  end
end
