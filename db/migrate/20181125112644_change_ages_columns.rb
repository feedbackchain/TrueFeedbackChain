class ChangeAgesColumns < ActiveRecord::Migration[5.2]
  def change
  	change_column :profiles, :max_age, :integer, default: 99
    change_column :profiles, :min_age, :integer, default: 13
  end
end
