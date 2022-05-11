class CoursesController < ApplicationController

    before_action :authenticate_user!
      
      def index
          # @courses = Course.all
          @courses = current_user.courses
      end

      def show
        @course = Course.find(params[:id])
    end
end
