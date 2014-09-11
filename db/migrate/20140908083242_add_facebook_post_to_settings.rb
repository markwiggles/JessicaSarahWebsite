class AddFacebookPostToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :facebook_post, :string
  end
end
