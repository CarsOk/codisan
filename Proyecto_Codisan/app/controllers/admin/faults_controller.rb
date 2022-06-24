class Admin::FaultsController < ApplicationController
    def index
        @faults = Fault.all
        @fault = Fault.new
    end

    def create
        @fault = Fault.new(fault_params)
        if @fault.save
            flash[:alert] = "Falta creado"
            redirect_to admin_faults_path
          else
              flash[:alert] = "Error al crear la Falta"
              redirect_to admin_faults_path
          end 
    end

    private 
    def fault_params
        params.require(:fault).permit(:category, :description, :sanction)
      end
end