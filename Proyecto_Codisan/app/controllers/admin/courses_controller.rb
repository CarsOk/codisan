class Admin::CoursesController < ApplicationController
    def index
       if current_user.has_role? :admin
            @courses = Course.all
       elsif 
           
       end
       
    end
end