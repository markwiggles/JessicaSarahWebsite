class CreateLogos < ActiveRecord::Migration
  def change
    create_table :logos do |t|
      t.string :name
      t.string :image_id
      t.string :image_url
      t.string :image_size
    end
  end
end
