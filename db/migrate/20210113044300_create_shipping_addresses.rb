class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string     :postal_code,        null: false
      t.string     :city,               null: false
      t.string     :address,            null: false
      t.string     :building
      t.string     :phone_num,          null: false
      t.integer    :shipping_area_id,   null: false
      t.references :order,              foreign_key: true
      t.timestamps
    end
  end
end
