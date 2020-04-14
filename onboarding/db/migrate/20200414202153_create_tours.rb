class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.timestamps :start_time
      t.references :customers, null: false, foreign_key: true
    end
  end
end
