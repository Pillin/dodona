class AddRepositoryTokenToExercise < ActiveRecord::Migration[5.0]
  def change
    add_column :exercises, :repository_token, :string, limit: 64 unless column_exists?(:exercises, :repository_token)
    change_column :exercises, :repository_token, :string, limit: 64, null: false if column_exists?(:exercises, :repository_token)
    add_index :exercises, :repository_token, unique: true unless index_exists?(:exercises, :repository_token)
  end
end
