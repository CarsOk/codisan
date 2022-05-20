class CreateCourseMatters < ActiveRecord::Migration[7.0]
  def change
    create_table :course_matters do |t|
      t.integer :course_id
      t.integer :matter_id

      t.timestamps
    end
  end
end
