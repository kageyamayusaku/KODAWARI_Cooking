class User::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    # ジャンル,タグ検索
    if params[:tag_ids]
      @recipes = []
      params[:tag_ids].each do |key, value|
        @recipes += Tag.find_by(name: key).recipes if value == "1"
      end
      @recipes.uniq!
    else params[:search]
      @recipes = Recipe.search(params[:search])
    end
    # タグのパラメータがあればindexアクション内でtagsテーブルに保存
    if params[:tag]
      Tag.create(name: params[:tag])
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
  end


  def update
    @recipe = Recipe.find(params[:id])
    # ➀下書きレシピの更新（公開）の場合
    if params[:publicize_draft]
      # レシピ公開時にバリデーションを実施
      # updateメソッドにはcontextが使用できないため、公開処理にはattributesとsaveメソッドを使用する
      @recipe.attributes = recipe_params.merge(is_draft: false)
      if @recipe.save(context: :publicize)
        redirect_to recipe_path(@recipe.id), notice: "下書きのレシピを公開しました！"
      else
        @recipe.is_draft = true
        render :edit, alert: "レシピを公開できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # ➁下書きレシピの更新（非公開）の場合
    elsif params[:update_draft]
      if @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe.id), notice: "下書きレシピを更新しました！"
      else
        render :edit, alert: "更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # ➂公開済みレシピの更新の場合
    elsif　params[:update_post]
      @recipe.attributes = recipe_params
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
    redirect_to action: :index, notice: "レシピを削除しました！"
  end


  def recipe_params
    params.require(:recipe).permit(
      :user_id, :genre_id, :material_id, :procedure_id, :title,
      :recipe_image, :introduction, :serving, :is_draft,
      materials_attributes: [:name, :amount, :_destroy],
      procedures_attributes: [:body, :_destroy],
      tag_ids: []
    )
  end

end
