class AddTokenToExercise < ActiveRecord::Migration[5.0]
  def change
    add_column :exercises, :token, :string, limit: 64 unless column_exists?(:exercises, :token)
    add_index :exercises, :token, unique: true unless index_exists?(:exercises, :token)
    # Backfill is skipped here to avoid coupling to the current Exercise model before table renames.
  end
end
