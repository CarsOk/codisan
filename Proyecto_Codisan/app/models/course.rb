class Course < ApplicationRecord

    has_many :course_users  
    has_many :users, through: :has_tools 

end
