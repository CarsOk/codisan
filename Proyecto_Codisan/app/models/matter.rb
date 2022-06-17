class Matter < ApplicationRecord
    has_and_belongs_to_many :courses
    has_many :tasks
    has_many :notes
    has_many :users, through: :notes

    # accepts_nested_attributes_for :notes
end
