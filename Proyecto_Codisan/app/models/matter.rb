class Matter < ApplicationRecord
    has_many :course_matters  
    has_many :courses, through: :course_matters
end
