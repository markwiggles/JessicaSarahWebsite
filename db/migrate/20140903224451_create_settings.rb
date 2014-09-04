class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :bio1
      t.string :bio2

      t.timestamps
    end
  end

  def down
    drop_table :settings
  end
end
