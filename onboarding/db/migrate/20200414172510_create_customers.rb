class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
R   create_table :customers do |t|
 R    t.string :name
      t.decimal :document
      t.boolean :active
      t.references :tours, null: false, foreign_key: true
    end
  end
end
