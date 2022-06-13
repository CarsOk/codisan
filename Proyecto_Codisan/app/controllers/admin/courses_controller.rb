class Admin::CoursesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_course, only: [:show, :edit, :destroy, :update]
    
    def index
        if current_user.has_role? :admin
            @courses = Course.all 
        end
    end 

    def show
        @matters = @course.matters
        
    end

    def new
        @users = User.all
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        if @course.save
            flash[:alert] = "Curso creado correctamente"
            redirect_to admin_courses_path
        else
            flash[:alert] = "Error al crear el curso"
            render :new
        end
    end

    def edit
        authorize User
        @users = User.all
    end

    def update
        params[:course] [:user_ids] ||= [] 
        if @course.update(course_params)
            flash[:alert] = "Curso actualizado correctamente"
            puts "entro"
            redirect_to admin_courses_path
        else
            flash[:alert] = "Error al actualizar el curso"
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

    # def destroy_matter
    #     @matter = Matter.find(params[:id])
    #         if @matter.destroy
    #             flash[:alert] = "Materia eliminada correctamente"
    #             redirect_to admin_course_matters_url
    #         else
    #             flash[:alert] = "Error al eliminar la materia"
    #         end
    # end
    #asignar una materia a un curso -->>
    # def asignar
    #     @course = Course.find(params[:course_id])
    #     @matters = Matter.all
    # end
    
    # def guardar
    #     @matter = Matter.find(matter_params)
    #     @course.matters << @matter
    #     if @course.save
    #         flash[:notice] = "Materia asignada correctamente"
    #         redirect_to admin_course_path(@course)
    #     else
    #         flash[:alert] = "Error al asignar materia"
    #         redirect_to admin_course_guardar_path(@course)
    #     end
    # end
    #<<--

    #asignar un usuario a un curso -->>
    # def asignar_user
    #     @course = Course.find(params[:course_id])
    #         if params[:document]
    #           @users = User.where(document: params[:document])
    #         else
    #             @users = User.all
    #          end                                           
    # end

    # def guardar_user
    #     @course = Course.find(params[:course_id])
    #     @user = User.find(params[:id])
    #     @course.users << @user
        
    # end
    #<<--

    private
        def set_course
            @course = Course.find(params[:id])
        end
    
        def course_params
            params.require(:course).permit(:name_course, matter_ids: [], user_ids: [], teacher_ids: [])
        end

end