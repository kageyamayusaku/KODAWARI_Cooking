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
      redirect_to recipe_path(@recipe.id), notice: "レシピを投稿しました！"
    else
      render :new, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def recipe_params
    params.require(:recipe).permit(
      :user_id, :genre_id, :tag_id, :material_id, :procedure_id, :title,
      :recipe_image, :introduction, :serving,
      materials_attributes: [:name, :amount, :_destroy],
      procedurees_attributes: [:body, :_destroy]
    )
  end

end
