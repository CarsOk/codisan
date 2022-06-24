class Admin::Observers::FaultObserversController < ApplicationController
    before_action :authenticate_user!
    before_action :set_fault_observer
    def new
        
        @observer = @observer.fault_observers.new
        @faults = Fault.all
    end

    def create
        @observer = @observer.fault_observers.new(fault_observer_params)
        if @observer.save
          flash[:alert] = "creado correctamente"
          redirect_to new_admin_observer_fault_observer_path
        else
            flash[:alert] = "Error al crear"
            redirect_to new_admin_observer_fault_observer_path
        end
      end

    private
        def fault_observer_params
            params.require(:fault_observer).permit(:description, :observer_id, :fault_id)
        end

        def set_fault_observer
            @observer = Observer.find(params[:observer_id])
        end
end