class AddExercisesVisibleToSeries < ActiveRecord::Migration[5.0]
  def change
    add_column :series, :exercises_visible, :boolean, null: false, default: true unless column_exists?(:series, :exercises_visible)
  end
end
