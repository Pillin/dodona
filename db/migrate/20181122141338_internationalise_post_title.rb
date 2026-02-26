class InternationalisePostTitle < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :title_en, :string unless column_exists?(:posts, :title_en)
    add_column :posts, :title_nl, :string unless column_exists?(:posts, :title_nl)
    remove_index :posts, [:title, :release] if index_exists?(:posts, [:title, :release])
    remove_column :posts, :title if column_exists?(:posts, :title)
    change_column :posts, :title_en, :string, null: false if column_exists?(:posts, :title_en)
    change_column :posts, :title_nl, :string, null: false if column_exists?(:posts, :title_nl)
  end
end
