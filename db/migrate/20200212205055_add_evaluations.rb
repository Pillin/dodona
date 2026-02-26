class AddEvaluations < ActiveRecord::Migration[6.0]
  def change
    unless table_exists?(:evaluations)
      create_table :evaluations do |t|
        t.references :series, foreign_key: true, type: :integer, unique: true
        t.boolean :released, default: false, null: false
        t.datetime :deadline, null: false
        t.timestamps
      end
    end

    unless table_exists?(:evaluation_exercises)
      create_table :evaluation_exercises do |t|
        t.references :evaluation, foreign_key: true
        t.references :exercise, foreign_key: { to_table: :exercises }, type: :integer
        t.index [:exercise_id, :evaluation_id], unique: true
        t.timestamps
      end
    end

    unless table_exists?(:evaluation_users)
      create_table :evaluation_users do |t|
        t.references :evaluation, foreign_key: true
        t.references :user, foreign_key: true, type: :integer
        t.index [:user_id, :evaluation_id], unique: true
        t.timestamps
      end
    end

    unless table_exists?(:feedbacks)
      create_table :feedbacks do |t|
        t.references :submission, foreign_key: true, type: :integer
        t.references :evaluation, foreign_key: true
        t.references :evaluation_user, foreign_key: true
        t.references :evaluation_exercise, foreign_key: true
        t.boolean :completed, default: false, null: false
        t.timestamps
      end
    end

    add_reference :annotations, :evaluation, foreign_key: true unless column_exists?(:annotations, :evaluation_id)
  end
end
