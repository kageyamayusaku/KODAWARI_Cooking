class User::HomesController < ApplicationController

  def guest_log_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
      user.skip_confirmation!
    end
    sign_in user
    redirect_to home_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def top
  end

  def home
  end

end
