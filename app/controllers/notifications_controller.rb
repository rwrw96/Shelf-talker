class NotificationsController < ApplicationController
  # ログインユーザーのみ許可する
  before_action :authenticate_user!, only: [:index]
  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    # 通知を確認後、ステータスを確認済みに変更
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end
