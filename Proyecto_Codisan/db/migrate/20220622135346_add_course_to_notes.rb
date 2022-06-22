class AddCourseToNotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes, :course, null: false, foreign_key: true
  end
end
