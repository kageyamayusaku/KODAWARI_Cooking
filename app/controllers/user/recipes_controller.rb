class User::RecipesController < ApplicationController

  def index
    @recipe_all = Recipe.all
    # ジャンル,タグ検索
    if params[:search_recipe]
      @recipes = Recipe.search(params[:search_recipe])
    elsif params[:search_genre]
      @recipes = Recipe.search_by_genre(params[:search_genre])
    elsif params[:tag_ids]
      tag_ids = Array(params[:tag_ids]).map(&:to_i)
      @recipes = Recipe.joins(:tags).where(tags: { id: tag_ids }).distinct
    end
  end


  def show
    @recipe = Recipe.find(params[:id])
    @post_comment = PostComment.new
    @step = 1
  end


  def new
    @recipe = Recipe.new
    # 親モデル.子モデル.buildで子モデルのインスタンス作成
    @materials = @recipe.materials.build
    @procedures = @recipe.procedures.build
  end


  def create
    @recipe = Recipe.new(recipe_params)
    # 投稿ボタンを押下した場合
    if params[:post]
      if @recipe.save(context: :publicize)
        redirect_to recipe_path(@recipe), notice: "レシピを投稿しました！"
      else
        render :new, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # 下書きボタンを押下した場合
    elsif params[:draft]
      @recipe.is_draft = true
      if @recipe.save(validate: false)
        redirect_to edit_recipe_path(@recipe), notice: "レシピを下書き保存しました！"
      else
        render :new, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    end
  end


  def edit
    @recipe = Recipe.find(params[:id])
    @recipes = Recipe.search(params[:search])
    # タグのパラメータがあればindexアクション内でtagsテーブルに保存
    if params[:tag]
      Tag.create(name: params[:tag])
    end
  end


  def update
    @recipe = Recipe.find(params[:id])
    # ➀下書きレシピの更新（公開）の場合
    if params[:publicize_draft]
      # モデルオブジェクトの属性を一括で更新する
      @recipe.assign_attributes(recipe_params.merge(is_draft: false))
      if @recipe.save(context: :publicize)
        redirect_to recipe_path(@recipe), notice: "下書きのレシピを公開しました！"
      else
        @recipe.is_draft = true
        render :edit, alert: "レシピを公開できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # ➁下書きレシピの更新（非公開）の場合
    elsif params[:update_draft]
      @recipe.assign_attributes(recipe_params)
      if @recipe.save(validate: false)
        redirect_to edit_recipe_path(@recipe), notice: "下書きレシピを更新しました！"
      else
        render :edit, alert: "更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # ➂公開済みレシピの更新の場合
    elsif params[:update_post]
      @recipe.assign_attributes(recipe_params)
      if @recipe.save(context: :publicize)
        redirect_to recipe_path(@recipe.id), notice: "レシピを更新しました！"
      else
        render :edit, alert: "レシピを更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    end
  end


  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to home_path, notice: "レシピを削除しました！"
  end


  protected

  def recipe_params
    params.require(:recipe).permit(
      :user_id, :genre_id, :material_id, :procedure_id, :title,
      :recipe_image, :introduction, :serving, :is_draft,
      materials_attributes: [:id, :name, :amount, :_destroy],
      procedures_attributes: [:id, :body, :_destroy],
      tag_ids: []
    )
  end

end
