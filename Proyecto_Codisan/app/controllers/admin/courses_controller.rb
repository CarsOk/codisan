class Admin::CoursesController < ApplicationController
    def index
       if current_user.has_role? :admin
            @courses = Course.all 
       end
       
    end
end