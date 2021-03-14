class ApplicationController < ActionController::Base

  helper_method :user_signed_in?
  helper_method :current_user
  helper_method :current_user_name

  def save_user_session(user)
    session[:user_id] = user.id
  end

  def user_signed_in?
    session[:user_id]
  end

  def current_user
    user_id = session[:user_id]
    User.find user_id
  end

  def current_user_name
    user_id = session[:user_id]
    if user_id
      User.find(user_id).name
    else
      ''
    end
  end
end
