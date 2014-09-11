class AddTwitterCountToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :twitter_count, :string
  end
end
