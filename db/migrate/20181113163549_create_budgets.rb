class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.decimal :fbcbudget, precision: 20, scale: 10, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
