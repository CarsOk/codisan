module DashboardHelper

    def botonCourse()
        if current_user.has_role? :admin
            admin_courses_path
        else
            courses_path
        end
    end

    def botonObservador()
        if current_user.has_role? :admin
            admin_observers_path
        else
            observers_path
        end
    end

    

end
