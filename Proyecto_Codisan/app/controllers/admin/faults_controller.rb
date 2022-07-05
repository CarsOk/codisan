class Admin::FaultsController < ApplicationController
    before_action :set_fault, only: [:edit, :update, :destroy]   
    def index
        @faults = Fault.all
        @fault = Fault.new
    end

    def create
        @fault = Fault.new(fault_params)
        if @fault.save
            flash[:alert] = "sancion creada correctamente"
            redirect_to admin_faults_path
          else
              flash[:alert] = "Error al crear la sancion"
              redirect_to admin_faults_path
          end 
    end

    def destroy
        if @fault.destroy
          flash[:success] = "sancion eliminada"  
          redirect_to photos_path
        else
          flash[:alert] = "Error al eliminar la sancion"
        end
    end

    def edit
      
    end

    def update
        
        if @fault.update(fault_params)
          flash[:alert] = "sancion actualizada correctamente"
          puts "entro"
          redirect_to admin_faults_path
        else
          flash[:alert] = "Error al actualizar la sancion"
          render :edit
        end
    end


    private 

    def set_fault
        @fault = Fault.find(params[:id])
    end

    def fault_params
        params.require(:fault).permit(:category, :description, :sanction)
      end
end