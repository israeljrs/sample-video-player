class Admin::ClientsController < ApplicationController
  load_and_authorize_resource
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @clients = Client.order(:nome).all.paginate( page: params[:page], per_page: 25)
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:success] = "Cliente incluido com sucesso !!!"
      redirect_to admin_client_path(@client)
    else
      flash.now[:danger] = "Falha na inclusão do cliente !!!"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @client.update(client_params)
      flash[:success] = "Cliente atualizado com sucesso !!!"
      redirect_to admin_client_path(@client)
    else
      flash.now[:danger] = "Falha na atualização do cliente"
      render :edit
    end
  end

  def destroy
    if @client.destroy
      flash[:success] = "Cliente excluido com sucesso !!"
      redirect_to admin_clients_path
    else
      flash.now[:danger] = "Falha na exclusão do cliente !!!"
      render :index
    end
  end

  def search
    name = params[:search]
    if name.include? "@"
      @clients = Client.where("lower(email) like lower(?)", "%#{name}%").paginate(page: params[:page], per_page: 25)
    else
      @clients = Client.where("lower(nome) like lower(?)", "%#{name}%").paginate(page: params[:page], per_page: 25)
    end
    @client_total = @clients.count
    @search = params[:search]
    render :index
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:nome, :email, :fone)
    end
end
