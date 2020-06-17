class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  # beforeフィルター
  
  #ログイン済みのユーザーか判定
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end
  
  #アクセスしたユーザーが現在ログインユーザー本人か判定
  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end
  
  #システム管理権限所有かどうか判定
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
  
  # システム管理者またはログインユーザー本人であるか判定
  def admin_or_correct
    unless current_user?(@user) || current_user.admin?
      flash[:danger] = "権限がありません。"
      redirect_to root_url
    end  
  end    
end
