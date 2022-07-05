class Admin::InformationController < ApplicationController
  before_action :authenticate_user!
  before_action :set_information, only: [:show, :edit, :destroy, :update]

  def index
    @informations = Information.all
  end

  def show
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    if @information.save
      flash[:success] = "registrada"
      redirect_to admin_information_index_path
    else
      flash[:alert] = "error"
    end
  end

  def edit
  end

  def update
    if @information.update(information_params)
      flash[:success] = "informacion actualizda correctamente"
      redirect_to admin_information_index_path
    else
      flash[:alert] = "Error al actualizar la informacion"
      render :edit
    end
  end

  private

  def set_information
    @information = Information.find(params[:id])
  end

  def information_params
    params.require(:information).permit(:name,:direction,:city, :email, :phone, :avatar)    
  end

end
