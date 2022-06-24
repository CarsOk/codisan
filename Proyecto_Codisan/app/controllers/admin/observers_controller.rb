class Admin::ObserversController < ApplicationController
  before_action :authenticate_user!
  before_action :set_observer, only:[:show]

  def index
    @students = User.all
    @observer = 
    #busqueda de estudiantes por documento
    @document = params[:document]
    if @document
      @students = User.where(:document => @document)
    else
      @students = User.all
    end

    @observadores = Observer.pluck(:id, :student_id)
  end

  def show
    @observer = Observer.find(params[:id])
    @fault_observers = @observer.fault_observers
  end

  def new
    @observer = Observer.new 
    @students = User.all
    @observadores = Observer.pluck(:id, :student_id)
  end


  def create
    @observer = Observer.new(observer_params)
    if @observer.save
      flash[:alert] = "observador creado"
      redirect_to admin_observers_path
    else
        flash[:alert] = "Error al crear el observador"
        redirect_to admin_observers_path
    end 
  end

  

  # def update
  #   @ = .find(params[:id])
  # end

  # def edit
  #   @ = .find(params[:id])
  # end

  # def destroy
  #    = .find(params[:id])
  # end


  private

  def set_observer
    @observer = Observer.find(params[:id])
  end
  
    def observer_params
      params.require(:observer).permit(:student_id)
    end
end