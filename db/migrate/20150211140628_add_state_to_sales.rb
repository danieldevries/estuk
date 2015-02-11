class AddStateToSales < ActiveRecord::Migration
  def change
    add_column :sales, :state, :string
  end
end
