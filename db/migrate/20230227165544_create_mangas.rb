class CreateMangas < ActiveRecord::Migration[7.0]
  def change
    create_table :mangas do |t|
      t.string :saga
      t.integer :volume
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
