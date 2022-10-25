class HomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.skip_confirmation!  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def admin_guest_sign_in
    user = User.guest_admin
    sign_in user
    redirect_to users_path, notice: '管理者ゲストユーザーとしてログインしました。'
  end
end
