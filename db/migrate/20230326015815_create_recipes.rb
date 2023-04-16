class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.references :user,     null: false, foreign_key: true
      t.references :genre,    null: false, foreign_key: true
      t.references :recipe_tag_relation, null: false, foreign_key: true
      t.string :title,        null: false
      t.string :introduction, null: false
      t.string :serving,      null: false
      t.boolean :is_draft,    null: false, default: false
      t.timestamps
    end
  end
end
