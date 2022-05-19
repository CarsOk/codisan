class Admin::Courses::MattersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_course
    
    
    def show
        @matter = @course.matters.find(params[:id])
        @users = @course.users
    end
    
    def new
        @matter = @course.matters.new
    end

    def create
        @matter = @course.matters.new(matter_params)
        if @matter.save
            redirect_to admin_course_matters_path
        else
            render :new
        end
    end
    
    # def edit
    #     @programa = @area.programas.find(params[:id])
    # end
    
    # def update
    #     @programa = @area.programas.find(params[:id])
    #     if @programa.update(programa_params_update)
    #       redirect_to area_programas_url
    #     else
    #       render :edit
    #     end
    # end
    
    # def destroy
    #     @programa = @area.programas.find(params[:id])
    #     if @programa.destroy
    #       flash[:alert] = "Programa eliminado correctamente"
    #     redirect_to area_programas_url
    #     else 
    #       flash[:alert] = "Error al eliminar el programa"
    #     end
    # end
    
    
    private
    
        def set_course
            @course = Course.find(params[:course_id])
        end

        def matter_params
            params.require(:matter).permit(:name_matter)
        end


      
        
        # def programa_params_update
        #     params.require(:programa).permit(:nombre)
        # end
    
end    