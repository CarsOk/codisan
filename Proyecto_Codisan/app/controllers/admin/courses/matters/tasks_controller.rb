class Admin::Courses::Matters::TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_matter
  
  def index
      @tasks = @matter.tasks
  end
  
  # #   def show
  # #     @ = .find(params[:id])
  # #   end

  def new
    @task = @matter.tasks.new
  end

  def create
    @task = @matter.tasks.new(params_task)
    if @task.save 
        flash[:alert]='Actividad creada correctamente'
        redirect_to new_admin_course_matter_task_path
    else
        flash[:alert] = "Error al crear la actividad"
    end
  end
  
  #   def update
  #     @ = .find(params[:id])
  #   end
  
  #   def edit
  #     @ = .find(params[:id])
  #   end
  
  #   def destroy
  #      = .find(params[:id])
  #   end

private

  def set_matter
    @matter = Matter.find(params[:matter_id])
  end
    
  def params_task
   params.require(:task).permit(:name_activity, :description_activity, :matter_id)
  end
    
end