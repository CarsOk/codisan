class DropCourseMatters < ActiveRecord::Migration[7.0]
 def up
  drop_table :course_matters
 end

 def down
  create_table :course_matters do |t|
    t.integer :course_id
    t.integer :matter_id

    t.timestamps
  end
 end

end
