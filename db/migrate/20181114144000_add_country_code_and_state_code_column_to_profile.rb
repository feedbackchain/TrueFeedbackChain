class AddCountryCodeAndStateCodeColumnToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :country_code, :string
    add_column :profiles, :state_code, :string
  end
end
