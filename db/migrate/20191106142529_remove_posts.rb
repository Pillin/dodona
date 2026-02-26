class RemovePosts < ActiveRecord::Migration[5.2]
  def change
    drop_table :posts if table_exists?(:posts)
    drop_table :action_text_rich_texts if table_exists?(:action_text_rich_texts)
    drop_table :active_storage_attachments if table_exists?(:active_storage_attachments)
    drop_table :active_storage_blobs if table_exists?(:active_storage_blobs)
  end
end
