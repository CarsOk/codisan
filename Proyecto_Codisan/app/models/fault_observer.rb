class FaultObserver < ApplicationRecord
    belongs_to :observer
    belongs_to :fault
end
