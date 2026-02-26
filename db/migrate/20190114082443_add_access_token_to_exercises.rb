class AddAccessTokenToExercises < ActiveRecord::Migration[5.0]
  def change
    add_column :exercises, :access_token, :string, limit: 16 unless column_exists?(:exercises, :access_token)
    change_column :exercises, :access_token, :string, null: false, limit: 16 if column_exists?(:exercises, :access_token)
    add_index :exercises, :access_token, unique: true unless index_exists?(:exercises, :access_token)
  end
end
