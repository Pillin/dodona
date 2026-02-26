class AddActivitiesCountToSeries < ActiveRecord::Migration[6.0]
  def change
    add_column :series, :activities_count, :integer unless column_exists?(:series, :activities_count)
  end
end
