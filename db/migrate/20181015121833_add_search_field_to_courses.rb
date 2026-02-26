class AddSearchFieldToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :search, :string, limit: 4096 unless column_exists?(:courses, :search)
  end
end
