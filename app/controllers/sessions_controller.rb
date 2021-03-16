class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by name: params[:name]
    if user
      save_user_session user
      redirect_to root_url
    else
      flash[:error] = 'That user does not exist...'
      render 'new'
    end
  end

  def destroy
    session.clear
    flash[:notice] = 'Sign out succesfully'
    redirect_to root_url
  end
end
