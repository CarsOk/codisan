class Admin::CoursesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_course, only: [:edit, :destroy]

    def index
       if current_user.has_role? :admin
            @courses = Course.all 
       end
    end

    def show
    end
    

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        if @course.save
            redirect_to admin_courses_path
        else
            render :new
        end
    end
  
      def edit
         authorize User
          @Course = Course.find(params[:id])
      end
  
      def update
          @course = Course.find(params[:id])
          if @course.update(course_params)
              redirect_to admin_courses_path
          else
              render :edit
          end
      end

      def destroy
        @course = Course.find(params[:id])
        if @course.destroy
          flash[:alert] = "Area eliminada correctamente"
          redirect_to admin_courses_path
        end
      end
  
  
      private

        def set_course
            @course = Course.find(params[:id])
        end
    
  
        def course_params
            params.require(:course).permit(:name_course)
        end
end