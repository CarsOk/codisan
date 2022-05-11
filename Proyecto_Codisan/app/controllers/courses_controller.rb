class CoursesController < ApplicationController

    before_action :authenticate_user!
      
      def index
        @courses = Course.all
      end

      def new
        @course = course.new
      end

      def show
        @course = Course.find(params[:id])
      end
  
      def edit
         authorize User
          @Course = Course.find(params[:id])
      end
  
      def update
          @course = Course.find(params[:id])
          if @course.update(course_params_update)
              redirect_to couses 89+_path
          else
              render :edit
          end
      end
  
  
      private
  
      def course_params_update
        params.require(:course).permit(:name_course)
      end

end
