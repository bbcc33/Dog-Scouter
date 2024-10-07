class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  def index
    @users = User.all
    @current_user = User.find_by(id: session[:current_user])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def login
    if current_user
      redirect_to cities_path, notice: 'You are already logged in.'
    else
      render :logon, notice: 'This user does not exist'

    end
  end

  def logon
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:current_user] = @user.id
      redirect_to cities_path, notice: "Welcome #{@user.email}. You are logged in."
    else
      Rails.logger.debug("Password authentication failed for user #{params[:email]}")
      flash.now[:alert] = 'Invalid email or password'
      render :logon
    end
  end

  def logoff
    session.delete(:current_user)
    redirect_to users_path, notice: 'You have logged off.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
