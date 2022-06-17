class Task < ApplicationRecord
    belongs_to :matter
    has_many :notes
end
