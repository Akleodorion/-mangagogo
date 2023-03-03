class RemovePictureFromMangas < ActiveRecord::Migration[7.0]
  def change
    remove_column :mangas, :picture
  end
end
