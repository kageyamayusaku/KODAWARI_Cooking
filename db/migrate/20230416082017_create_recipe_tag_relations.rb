class CreateRecipeTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_tag_relations do |t|
      t.references :recipe, foreign_key: true # , null: false
      t.references :tag,    foreign_key: true # , null: false

      t.timestamps
    end
    # 同じタグを２回保存するのは出来ないようになる
    add_index :recipe_tag_relations, [:recipe_id, :tag_id], unique: true
  end
end
