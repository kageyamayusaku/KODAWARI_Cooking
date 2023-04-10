class User::RecipesController < ApplicationController

  def index
    #Viewのformで取得したパラメータをモデルに渡す
    @search = Recipe.search(params[:search])
  end

  def show
    @post_comment = PostComment.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
