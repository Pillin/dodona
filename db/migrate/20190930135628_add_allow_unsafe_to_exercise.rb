class AddAllowUnsafeToExercise < ActiveRecord::Migration[5.0]
  def change
    add_column :exercises, :allow_unsafe, :boolean, default: false, null: false unless column_exists?(:exercises, :allow_unsafe)
  end
end
