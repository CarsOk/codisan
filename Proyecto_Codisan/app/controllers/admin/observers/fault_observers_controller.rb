class Admin::Observers::FaultObserversController < ApplicationController
    before_action :authenticate_user!
    before_action :set_observer

    def new
        @fault_observer = @observer.fault_observers.new
        @faults = Fault.all
    end

    def create
        @fault_observer = @observer.fault_observers.new(fault_observer_params)
        if @fault_observer.save
          flash[:alert] = "creado correctamente"
          redirect_to new_admin_observer_fault_observer_path
        else
            flash[:alert] = "Error al crear"
            redirect_to new_admin_observer_fault_observer_path
        end
      end

      def edit
        @fault_observer = @observer.fault_observers.find(params[:id])
        @faults = Fault.all
      end

      def update
        @fault_observer = @observer.fault_observers.find(params[:id])
        if @fault_observer.update(fault_observer_params)
            
          flash[:alert] = "falta actualizada correctamente"
          redirect_to admin_observers_path
        else
          flash[:alert] = "Error al actualizar la falta"
          render :edit
        end
    end

     def destroy
        @fault_observer = @observer.fault_observers.find(params[:id])
        if  @fault_observer.destroy
            flash[:success] = "falta eliminada"  
            redirect_to admin_observers_path
        else
            flash[:alert] = "Error al eliminar la falta"
            redirect_to admin_observers_path
        end
     end

    private
        def fault_observer_params
            params.require(:fault_observer).permit(:description, :observer_id, :fault_id)
        end

        def set_observer
            @observer = Observer.find(params[:observer_id])
        end
end