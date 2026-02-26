class RemoveRunnerColumnFromJudge < ActiveRecord::Migration[5.0]
  def change
    remove_column :judges, :runner if column_exists?(:judges, :runner)
  end
end
