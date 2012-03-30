class UsersController < ApplicationController
  before_filter :is_admin
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  # GET /proyectos/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def update
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Usuario fue actualizado!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
    @user = User.find(params[:id])
  end
end
