class Admin::CoursesController < ApplicationController
    def index
       if current_user.has_role? :admin
            @courses = Course.all 
       end
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

    def show
        @course = Course.find(params[:id])
    end
  
      def edit
         authorize User
          @Course = Course.find(params[:id])
      end
  
      def update
          @course = Course.find(params[:id])
          if @course.update(course_params)
              redirect_to couses 89+_path
          else
              render :edit
          end
      end
  
  
      private
  
      def course_params
        params.require(:course).permit(:name_course)
      end
end