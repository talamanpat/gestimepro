class ApplicationController < ActionController::Base
  before_filter :check_auth
  protect_from_forgery
  helper_method :current_user
  def usuario_actual

  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def check_auth
    if session[:user_id] == nil
      flash[:notice] = "Sorry, Haga login"
      redirect_to log_in_path
    end
  end

  def is_admin
    if !User.find(session[:user_id]).admin?
      flash[:notice] = "Sorry, no tiene permisos"
      redirect_to root_url
    end
  end



end
