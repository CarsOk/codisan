class Admin::CoursesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_course, only: [:show, :edit, :destroy]
    
    def index
       if current_user.has_role? :admin
            @courses = Course.all 
       end
    end 

    def show
        @course = Course.find(params[:id])
        @matters = @course.matters
    end

    #asignar una materia a un curso -->>
    def asignar
        @course = Course.find(params[:course_id])
        @matters = Matter.all
    end
    
    def guardar
        @course = Course.find(params[:course_id])
        @matter = Matter.find(params[:matter_id])
        @course.matters << @matter
        redirect_to admin_course_matters_url

    end
    #<<--

    #asignar un usuario a un curso -->>
    def asignar_user
        @course = Course.find(params[:course_id])
            if params[:document]
              @users = User.where(document: params[:document])
            else
                @users = User.all
             end                                           
    end

    def guardar_user
        @course = Course.find(params[:course_id])
        @user = User.find(params[:id])
        @course.users << @user
        
    end
    #<<--

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
            flash[:alert] = "Curso eliminada correctamente"
            redirect_to admin_courses_path
        else 
            flash[:alert] = "Error al eliminar el curso"
        end
      end
  
  
      private

        def set_course
            @course = Course.find(params[:id])
        end

        def set_user
            @user = User.find(params[:id])
        end
    
        def course_params
            params.require(:course).permit(:name_course)
        end

        def matter_params
            params.require(:matter).permit(:name_matter)
        end
end