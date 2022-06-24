class Observer < ApplicationRecord
    belongs_to :student, class_name: 'User'
    has_many :fault_observers
    has_many :faults, through: :fault_observers
end
