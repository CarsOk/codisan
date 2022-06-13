class Course < ApplicationRecord
    has_many :course_users, dependent: :destroy
    has_many :users, through: :course_users

    has_and_belongs_to_many :matters
    
    # has_and_belongs_to_many :users, :join_table => :course_users
    accepts_nested_attributes_for :matters
    accepts_nested_attributes_for :users
end
