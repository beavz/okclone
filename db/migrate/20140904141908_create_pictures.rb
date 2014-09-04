class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.attachment :image
      t.text :caption
      t.integer :album_id

      t.timestamps
    end

    add_index :pictures, :album_id
  end
end
