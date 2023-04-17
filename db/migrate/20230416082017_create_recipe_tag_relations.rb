class CreateRecipeTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_tag_relations do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :tag,    null: false, foreign_key: true

      t.timestamps
    end
    # 同じタグを２回保存するのは出来ないようになる
    add_index :recipe_tag_relations, [:recipe_id, :tag_id], unique: true
  end
end
