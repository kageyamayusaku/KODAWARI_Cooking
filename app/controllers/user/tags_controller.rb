class User::TagsController < ApplicationController

  def create_tag_without_recipe
    tag = Tag.new(tag_params)
    if tag.save
      redirect_to new_recipe_path
    else
      render 'recipes/new'
    end
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    tag = Tag.new(tag_params)
    if tag.save
      RecipeTagRelation.create(recipe_id: recipe.id, tag_id: tag.id)
      redirect_to edit_recipe_path(recipe)
    else
      render 'recipes/edit'
    end
  end

  private

  def tag_params
    params.permit(:name)
  end

end
