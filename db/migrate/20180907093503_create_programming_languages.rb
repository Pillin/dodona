class CreateProgrammingLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :programming_languages do |t|
      t.string :name, null: false
      t.string :markdown_name, null: false
      t.string :editor_name, null: false
      t.string :extension, null: false

      t.timestamps
    end unless table_exists?(:programming_languages)

    add_index :programming_languages, :name, unique: true unless index_exists?(:programming_languages, :name)

    add_column :exercises, :programming_language_id, :integer unless column_exists?(:exercises, :programming_language_id)
    remove_column :exercises, :programming_language if column_exists?(:exercises, :programming_language)
    add_foreign_key :exercises, :programming_languages unless foreign_key_exists?(:exercises, :programming_languages)
  end
end
