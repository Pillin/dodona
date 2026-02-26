class RemoveUgentIdFromDatabase < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :ugent_id if column_exists?(:users, :ugent_id)
  end
end
