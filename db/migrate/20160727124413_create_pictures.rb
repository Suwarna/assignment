class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :photo
      t.string :photo_file_name
      t.string :photo_content_type
      t.string :photo_file_size
      t.datetime :photo_updated_at
      t.references    :pictureable, polymorphic: true
      t.timestamps
    end
  end
end
