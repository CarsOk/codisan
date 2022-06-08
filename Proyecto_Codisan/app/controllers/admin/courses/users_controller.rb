class Admin::Courses::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:index, :destroy_user]
  before_action :set_user, only: []


  def index
    @users = @course.users
  end

  
  
  private

    def set_course
      @course = Course.find(params[:course_id])
    end

    def set_user
      @user = User.find(params[:id])
    end
end    