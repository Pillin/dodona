class AddAccessToExercise < ActiveRecord::Migration[5.0]
  def change
    add_column :exercises, :access, :integer, null: false, default: 0 unless column_exists?(:exercises, :access)
    remove_column :exercises, :visibility if column_exists?(:exercises, :visibility)
  end
end
