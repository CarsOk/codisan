class AddTaskToNotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes, :task, index: true
  end
end
