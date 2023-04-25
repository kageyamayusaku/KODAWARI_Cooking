class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.references :user,     null: false, foreign_key: true
      t.references :genre,                 foreign_key: true # , null: false
      t.references :recipe_tag_relation,   foreign_key: true # , null: false
      t.string :title,        null: false
      t.string :introduction, null: false
      t.string :serving,      null: false
      t.boolean :is_draft,    null: false, default: false
      t.timestamps
    end
  end
end
