class ApplicationController < ActionController::Base
  include SessionHelper

  before_action :require_login

  private

  def require_login
    redirect_to root_url unless signed_in?
  end

  def admin_access
    redirect_to root_url unless current_user.role == 'admin'
  end

  def current_or_admin?
    redirect_to root_url if (current_user != @user) && (current_user.role != 'admin')
  end

  def current?
    redirect_to root_url unless current_user == @user
  end
end
