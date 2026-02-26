class AddGeneratedNameToInstitutions < ActiveRecord::Migration[6.0]
  def change
    add_column :institutions, :generated_name, :boolean, default: true, null: false unless column_exists?(:institutions, :generated_name)
  end
end
