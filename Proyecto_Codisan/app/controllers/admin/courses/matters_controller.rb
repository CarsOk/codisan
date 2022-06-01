class Admin::Courses::MattersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_course 
    
    def index
        @matters = @course.matters   
    end

    def show
        @matter = @course.matters.find(params[:id])
        @users = @course.users
    end

    def destroy_matter
        @matter = @course.matters.find(params[:id])
        @course = @course.matters.destroy(@matter)
        redirect_to admin_course_matters_path
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
        # @matter = @course.matters.find(params[:id])
    # end

    # def update
        # @matter = @course.matters.find(params[:id])
        # if @matter.update(matter_params)
            # redirect_to admin_course_matters_path
        # else
            # render :edit
        # end
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