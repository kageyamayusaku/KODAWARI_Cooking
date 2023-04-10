class User::RecipesController < ApplicationController

  def index
    #Viewのformで取得したパラメータをモデルに渡す
    @search = Recipe.search(params[:search])
  end

  def show
    @post_comment = PostComment.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "投稿しました！"
      redirect_to recipe_path(@recipe.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def recipe_params
    params.require(:recipe).permit(:user_id, :genre_id, :tag_id, :title, :recipe_image, :material, :seasoning, :introduction, :process)
  end

end
