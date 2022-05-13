class Course < ApplicationRecord
    has_many :course_users, dependent: :destroy
    has_many :users, through: :course_users

    has_many :course_matters, dependent: :destroy
    has_many :matters, through: :course_matters
    # has_and_belongs_to_many :users, :join_table => :course_users

end
