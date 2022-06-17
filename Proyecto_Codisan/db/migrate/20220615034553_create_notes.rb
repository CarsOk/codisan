class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.integer :qualification  
      t.references :matter, null: false, foreign_key: true
      t.belongs_to :student, null: false,  foreign_key: {to_table: :users}
      t.belongs_to :teacher, null: false,  foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
