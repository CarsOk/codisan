class CourseMatter < ApplicationRecord
    belongs_to :matter
    belongs_to :course
end
