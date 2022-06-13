class CreateJoinTableCoursesMatters < ActiveRecord::Migration[7.0]
  def change
    create_join_table :courses, :matters do |t|
       t.index [:course_id, :matter_id], :unique =>  true 
      # t.index [:matter_id, :course_id]
    end
  end
end
