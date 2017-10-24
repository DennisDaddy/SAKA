class AddAdminToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :admin, :boolean
  end
end
