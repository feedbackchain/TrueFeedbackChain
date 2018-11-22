class AddAgesToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :max_age, :integer, default: 13
    add_column :profiles, :min_age, :integer, default: 99
  end
end
