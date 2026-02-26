class AddOrderToSeries < ActiveRecord::Migration[5.0]
  def change
    change_column :series, :order, :integer, default: 0, null: false if column_exists?(:series, :order)
  end
end
