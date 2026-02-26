class AddSearchFieldToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :search, :string, limit: 4096 unless column_exists?(:users, :search)
  end
end
