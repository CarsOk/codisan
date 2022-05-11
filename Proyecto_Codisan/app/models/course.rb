class Course < ApplicationRecord
    has_many :course_users  
    has_many :users, through: :course_users 
    # has_and_belongs_to_many :users, :join_table => :course_users

end
