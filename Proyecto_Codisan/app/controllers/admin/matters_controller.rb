class Admin::MattersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @matters = Matter.all
        @matter = Matter.new
    end
    
    def show
        # @matter = Matter.find(params[:id])
    end
    
    def new
        @matter = Matter.new
    end

    def create
        @matter = Matter.new(matter_params)
        if @matter.save
            redirect_to admin_matters_path
        else
            render :new
        end
    end
    
    def edit
        @matter = Matter.find(params[:id])
    end
    
    def update
        @matter = Matter.find(params[:id])
        if @matter.update(matter_params)
          redirect_to admin_matters_path
        else
          render :edit
        end
    end
    
    def destroy
        @matter = Matter.find(params[:id])
        if @matter.destroy
          flash[:alert] = "Materia eliminada correctamente"
        redirect_to admin_matters_path
        else 
          flash[:alert] = "Error al eliminar la materia"
        end
    end
    
    
    private
        
        def matter_params
            params.require(:matter).permit(:name_matter)
        end
        
    
end    