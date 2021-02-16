class ApplicationController < ActionController::Base
  before_action :set_user
  before_action :set_notifications


  private

  def set_user
    @user = User.first
    if !@user.present?
      User.create name: "user 1"
      User.create name: "user 2"
      @user = User.first
    end
  end

  def set_notifications
    if @user.present?
      @notifications = Notification.where(receiver: @user).unread
    else
      redirect_to root_path, alert: "Acción no permitida"
    end
  end
end
