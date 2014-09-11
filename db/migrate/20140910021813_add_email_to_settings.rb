class AddEmailToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :email_subject, :string
    add_column :settings, :email_heading, :string
    add_column :settings, :email_greeting, :string
    add_column :settings, :email_body, :string
    add_column :settings, :email_signature, :string
  end
end
