class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :profilable, polymorphic: true, null: true
      t.integer :country, index: true
      t.integer :city, index: true
      t.integer :gender, index: true
      t.integer :lang, index: true
      t.date :birthday, index: true

      t.timestamps
    end
  end
end
