module CoursesHelper
    def boton_color(course, roll)
        if roll == "admin"
            course.name_course
        else
            course.id
        end
    end
end
