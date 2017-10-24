class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :ip
      t.string :express_token
      t.string :express_payer_id
      t.string :violation_id


      t.timestamps
    end
  end
end
