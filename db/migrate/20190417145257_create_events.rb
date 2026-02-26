class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    return if table_exists?(:events)

    create_table :events do |t|
      t.integer :event_type, null: false
      t.integer :user_id
      t.string :message, null: false

      t.timestamps
    end

    add_index :events, :event_type unless index_exists?(:events, :event_type)
    add_foreign_key :events, :users, on_delete: :cascade unless foreign_key_exists?(:events, :users)
  end
end
