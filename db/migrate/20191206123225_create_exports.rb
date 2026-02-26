class CreateExports < ActiveRecord::Migration[5.2]
  def change
    return if table_exists?(:exports)

    create_table :exports do |t|
      t.references :user, foreign_key: true, type: :integer
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
