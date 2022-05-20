module DashboardHelper

    def botonCourse()
        if current_user.has_role? :admin
            admin_courses_path
        else
            courses_path
        end
    end

end
