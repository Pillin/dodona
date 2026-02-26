class RemoveExerciseToken < ActiveRecord::Migration[5.0]
  def change
    remove_column :exercises, :token if column_exists?(:exercises, :token)
  end
end
