class User::HomesController < ApplicationController

  def guest_log_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
      # user.skip_confirmation!
      # ↑Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to home_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def top
  end

  def home
    @recipes = Recipe.search(params[:search])
    @random_recipes = Recipe.where(is_draft: false).order('RANDOM()').limit(3)
    @random_recipes_week = Recipe.where(is_draft: false).order('RANDOM()').limit(7)

    require 'date'
    @today = Date.today
  end

end
