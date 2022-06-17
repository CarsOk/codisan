class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name_activity
      t.text :description_activity
      
      t.references :matter, null: false, foreign_key: true
      t.timestamps
    end
  end
end
