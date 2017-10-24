class CreateDonates < ActiveRecord::Migration[5.0]
  def change
    create_table :donates do |t|
      t.integer :amount

      t.timestamps
    end
  end
end
