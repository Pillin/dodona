class AddModeratedToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :moderated, :boolean, null: false, default: false unless column_exists?(:courses, :moderated)
  end
end
