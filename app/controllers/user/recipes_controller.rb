class User::RecipesController < ApplicationController

  def create
  end

  def show
  end

  def edit
  end

  def index
    #Viewのformで取得したパラメータをモデルに渡す
    @search = Recipe.search(params[:search])
  end

end
