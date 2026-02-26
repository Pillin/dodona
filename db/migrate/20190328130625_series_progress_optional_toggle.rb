class SeriesProgressOptionalToggle < ActiveRecord::Migration[5.0]
  def change
    add_column :series, :progress_enabled, :boolean, null: false, default: true unless column_exists?(:series, :progress_enabled)
  end
end
