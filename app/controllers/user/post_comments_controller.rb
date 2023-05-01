class User::PostCommentsController < ApplicationController

  def create
    recipe = Recipe.find(params[:recipe_id])
    #comment = current_user.post_comments.new(post_comment_params)
    # 上記と下記は同じ。
    comment = PostComment.new(post_comment_params)
    comment.user_id = current_user.id
    comment.recipe_id = recipe.id
    comment.save
    redirect_to recipe_path(recipe)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
