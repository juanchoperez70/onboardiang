class CreateJoinTableCustomersTours < ActiveRecord::Migration[6.0]
  def change
    create_join_table :customers, :tours do |t|
      # t.index [:customer_id, :tour_id]
      # t.index [:tour_id, :customer_id]
    end
  end
end
