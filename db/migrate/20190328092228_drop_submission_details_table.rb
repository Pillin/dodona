class DropSubmissionDetailsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :submission_details if table_exists?(:submission_details)
  end
end
