class RemoveCountryAndCityColumnsFromProfile < ActiveRecord::Migration[5.2]
  def change
  	remove_column :profiles, :country
    remove_column :profiles, :city
  end
end
