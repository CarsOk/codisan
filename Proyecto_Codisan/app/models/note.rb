class Note < ApplicationRecord
  belongs_to :matter
  belongs_to :student, class_name: 'User'
  belongs_to :teacher, class_name: 'User'

  
  
end
