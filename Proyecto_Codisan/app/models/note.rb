class Note < ApplicationRecord
  belongs_to :matter
  belongs_to :task
  belongs_to :student, class_name: 'User'
  belongs_to :teacher, class_name: 'User'
  belongs_to :course

  accepts_nested_attributes_for :task
  
end
