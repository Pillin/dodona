class CreateCourseRepository < ActiveRecord::Migration[5.0]
  def change
    return if table_exists?(:course_repositories)

    create_table :course_repositories do |t|
      t.integer :course_id, null: false
      t.integer :repository_id, null: false
    end

    add_index :course_repositories, [:course_id, :repository_id], unique: true unless index_exists?(:course_repositories, [:course_id, :repository_id])
    add_foreign_key :course_repositories, :courses unless foreign_key_exists?(:course_repositories, :courses)
    add_foreign_key :course_repositories, :repositories unless foreign_key_exists?(:course_repositories, :repositories)
  end
end
