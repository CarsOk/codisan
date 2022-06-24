class Fault < ApplicationRecord
    has_many :fault_observers
    has_many :observers, through: :fault_observers
end
