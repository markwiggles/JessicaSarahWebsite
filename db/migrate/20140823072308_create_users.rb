class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :limit => 25
      t.integer :access_level
      t.string :email
      t.datetime :password_reset_token
      t.datetime :password_reset_sent_at
      t.string :password_digest
      t.timestamps
    end
  end

  def down
    drop_table(:users)
  end
end
