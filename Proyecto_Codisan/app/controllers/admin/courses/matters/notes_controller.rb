class   Admin::Courses::Matters::NotesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_matter
    before_action :set_course
    
  
    def index
      @notes = Note.all
    end

    def show
      @note = @matter.notes.find(params[:id])
    end
  
    def new
      @users = @course.users
      
      @note = @matter.notes.new
      @tasks = @matter.tasks.pluck(:name_activity, :id)
      
      
    end
  
    def create
      @note = @matter.notes.new(note_params)
      if @note.save
        flash[:alert] = "nota creada"
        redirect_to new_admin_course_matter_note_path
      else
          flash[:alert] = "Error al crear la nota"
          redirect_to new_admin_course_matter_note_path
      end
    end
  
    private
      def set_matter
        @matter = Matter.find(params[:matter_id])
      end

      def set_course
        @course = Course.find(params[:course_id])
      end
  
      def note_params
        params.require(:note).permit(:qualification, :matter_id, :teacher_id, :student_id, :task_id, :course_id)
      end
  
      
  end