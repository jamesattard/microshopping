class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.integer :product_id
      t.integer :price
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps null: false
    end
  end
end
