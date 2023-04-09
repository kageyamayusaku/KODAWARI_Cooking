class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.integer :tag_id, null: false
      t.string :title, null: false
      t.string :seasoning, null: false
      t.string :introduction, null: false
      t.string :process, null: false
      t.timestamps
    end
  end
end
