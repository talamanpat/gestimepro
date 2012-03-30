class SessionsController < ApplicationController
  before_filter :check_auth, :except => [:new, :create]
  def new
    render :layout => 'clean'
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logueado!"
    else
      flash.now.alert = "Email o password invalido"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to log_in_path, :notice => "Deslogueado!"
  end
end
