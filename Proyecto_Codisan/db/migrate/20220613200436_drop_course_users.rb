class DropCourseUsers < ActiveRecord::Migration[7.0]
  
  def up
    drop_table :course_users
  end

  def down
    create_table :course_users do |t|
      t.integer :course_id
      t.integer :user_id

      t.timestamps
    end
  end

end
