class ChangeColumnNameInItems < ActiveRecord::Migration
  def change

    rename_column :items, :description, :text

  end
end
