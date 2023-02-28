class AddDescriptionToMangas < ActiveRecord::Migration[7.0]
  def change
    add_column :mangas, :description, :string
  end
end
