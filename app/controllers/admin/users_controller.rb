class Admin::UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @users = User.order(:email).all.paginate( page: params[:page], per_page: 25)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Usuário incluido com sucesso !!!"
      redirect_to admin_user_path(@user)
    else
      flash.now[:danger] = "Falha na inclusão do Usário !!!"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_without_password(user_params)
      flash[:success] = "Usário atualizado com sucesso !!!"
      redirect_to admin_user_path(@user)
    else
      flash.now[:danger] = "Falha na atualização do Usuário"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "Usário excluido com sucesso !!"
      redirect_to admin_users_path
    else
      flash.now[:danger] = "Falha na exclusão do Usuário !!!"
      render :index
    end
  end

  def search
    name = params[:search]
    if name.include? "@"
      @users = User.where("lower(email) like lower(?)", "%#{name}%").paginate(page: params[:page], per_page: 25)
    else
      @users = User.where("lower(username) like lower(?)", "%#{name}%").paginate(page: params[:page], per_page: 25)
    end
    @user_total = @users.count
    @search = params[:search]
    render :index
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      # params.require(:user).permit(:email, :username, :phone, :password, :password_confirmation)
      accessible = [ :email, :username, :phone ]
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      accessible << [role_ids: []] if current_user.has_role? :admin # don't do this. There are better ways.
      params.require(:user).permit(accessible)
    end
end