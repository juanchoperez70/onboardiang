class CreateToursTable < ActiveRecord::Migration[6.0]
  def change
   create_table :tours do |t|
     t.string :name
     t.timestamp :start_time
    end
  end
end
