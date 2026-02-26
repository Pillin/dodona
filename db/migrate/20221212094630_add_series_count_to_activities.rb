class AddSeriesCountToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :series_count, :integer, default: 0, null: false unless column_exists?(:activities, :series_count)
  end
end
