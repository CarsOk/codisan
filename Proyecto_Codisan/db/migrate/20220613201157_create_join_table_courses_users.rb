class CreateJoinTableCoursesUsers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :courses, :users do |t|
      # t.index [:course_id, :user_id]
      # t.index [:user_id, :course_id]
    end

    add_index :courses_users, [:course_id, :user_id], unique: true
  end
end
