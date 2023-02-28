class AddPictureToMangas < ActiveRecord::Migration[7.0]
  def change
    add_column :mangas, :picture, :string
  end
end
