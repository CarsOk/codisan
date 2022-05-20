class CoursePolicy < ApplicationPolicy
    attr_reader :current_user, :course
  
    def initialize(current_user, course)
        @current_user  = current_user
        @course = course
    end

    def index?
        current_user.has_role? :admin
    end
end