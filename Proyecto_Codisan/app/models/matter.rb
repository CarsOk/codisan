class Matter < ApplicationRecord
    has_many :course_matters, dependent: :destroy
    has_many :courses, through: :course_matters
end
