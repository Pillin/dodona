class AddIndexToAnnotation < ActiveRecord::Migration[6.0]
  def change
    add_column :annotations, :course_id, :integer unless column_exists?(:annotations, :course_id)
    add_foreign_key :annotations, :courses unless foreign_key_exists?(:annotations, :courses)
    add_index :annotations, [:course_id, :type, :question_state] unless index_exists?(:annotations, [:course_id, :type, :question_state])
  end
end
